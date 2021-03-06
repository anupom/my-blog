<?php
/**
 * @package Habari
 *
 */

/**
 *
 * Includes an instance of the PostInfo class; for holding inforecords about a Post
 * If the Post object describes an existing post; use the internal info object to
 * get, set, unset and test for existence (isset) of info records.
 * <code>
 * $this->info= new PostInfo( 1 );  // Info records of post with id = 1
 * $this->info->option1= "blah"; // set info record with name "option1" to value "blah"
 * $info_value= $this->info->option1; // get value of info record with name "option1" into variable $info_value
 * if ( isset ( $this->info->option1 ) )  // test for existence of "option1"
 * unset ( $this->info->option1 ); // delete "option1" info record
 * </code>
 *
 */
class Post extends QueryRecord implements IsContent
{
	// static variables to hold post status and post type values
	static $post_status_list = array();
	static $post_type_list_active = array();
	static $post_type_list_all = array();

	private $tags = null;
	private $comments_object = null;
	private $author_object = null;
	private $tokens = null;

	private $info = null;

	protected $url_args;

	/**
	 * returns an associative array of active post types
	 * @param bool whether to force a refresh of the cached values
	 * @return array An array of post type names => integer values
	**/
	public static function list_active_post_types( $refresh = false )
	{
		if ( ( ! $refresh ) && ( ! empty( self::$post_type_list_active ) ) ) {
			return self::$post_type_list_active;
		}
		self::$post_type_list_active['any'] = 0;
		$sql = 'SELECT * FROM {posttype} WHERE active = 1 ORDER BY id ASC';
		$results = DB::get_results( $sql );
		foreach ( $results as $result ) {
			self::$post_type_list_active[$result->name] = $result->id;
		}
		return self::$post_type_list_active;
	}

	/**
	 * returns an associative array of all post types
	 * @param bool whether to force a refresh of the cached values
	 * @return array An array of post type names => (integer values, active values)
	**/
	public static function list_all_post_types( $refresh = false )
	{
		if ( ( ! $refresh ) && ( ! empty( self::$post_type_list_all ) ) ) {
			return self::$post_type_list_all;
		}
		self::$post_type_list_all['any'] = 0;
		$sql = 'SELECT * FROM {posttype} ORDER BY id ASC';
		$results = DB::get_results( $sql );
		foreach ( $results as $result ) {
			self::$post_type_list_all[$result->name] = array(
				'id' => $result->id,
				'active' => $result->active
				);
		}
		return self::$post_type_list_all;
	}

	public static function activate_post_type( $type )
	{
		$all_post_types = Post::list_all_post_types( true ); // We force a refresh

		// Check if it exists
		if ( array_key_exists( $type, $all_post_types ) ) {
			if ( ! $all_post_types[$type]['active'] == 1 ) {
				// Activate it
				$sql = 'UPDATE {posttype} SET active = 1 WHERE id = ' . $all_post_types[$type]['id'];
				DB::query( $sql );
			}
			return true;
		}
		else {
			return false; // Doesn't exist
		}
	}

	public static function deactivate_post_type( $type )
	{
		$active_post_types = Post::list_active_post_types( false ); // We force a refresh

		if ( array_key_exists( $type, $active_post_types ) ) {
			// $type is active so we'll deactivate it
			$sql = 'UPDATE {posttype} SET active = 0 WHERE id = ' . $active_post_types[$type];
			DB::query( $sql );
			return true;
		}
		return false;
	}

	/**
	 * returns an associative array of post statuses
	 * @param mixed $all true to list all statuses, not just external ones, Post to list external and any that match the Post status
	 * @param boolean $refresh true to force a refresh of the cached values
	 * @return array An array of post statuses names => interger values
	**/
	public static function list_post_statuses( $all = true, $refresh = false )
	{
		$statuses = array();
		$statuses['any'] = 0;
		if ( $refresh || empty( self::$post_status_list ) ) {
			$sql = 'SELECT * FROM {poststatus} ORDER BY id ASC';
			$results = DB::get_results( $sql );
			self::$post_status_list = $results;
		}
		foreach ( self::$post_status_list as $status ) {
			if ( $all instanceof Post ) {
				if( ! $status->internal || $status->id == $all->status ) {
					$statuses[$status->name] = $status->id;
				}
			}
			elseif ( $all ) {
				$statuses[$status->name] = $status->id;
			}
			elseif ( ! $status->internal ) {
				$statuses[$status->name] = $status->id;
			}
		}
		return $statuses;
	}

	/**
	 * returns the interger value of the specified post status, or false
	 * @param mixed a post status name or value
	 * @return mixed an integer or boolean false
	**/
	public static function status( $name )
	{
		$statuses = Post::list_post_statuses();
		if ( is_numeric( $name ) && ( FALSE !== in_array( $name, $statuses ) ) ) {
			return $name;
		}
		if ( isset( $statuses[strtolower( $name )] ) ) {
			return $statuses[strtolower( $name )];
		}
		return false;
	}

	/**
	 * returns the friendly name of a post status, or null
	 * @param mixed a post status value, or name
	 * @return mixed a string of the status name, or null
	**/
	public static function status_name( $status )
	{
		$statuses = array_flip( Post::list_post_statuses() );
		if ( is_numeric( $status ) && isset( $statuses[$status] ) ) {
			return $statuses[$status];
		}
		if ( FALSE !== in_array( $status, $statuses ) ) {
			return $status;
		}
		return '';
	}

	/**
	 * returns the integer value of the specified post type, or false
	 * @param mixed a post type name or number
	 * @return mixed an integer or boolean false
	**/
	public static function type( $name )
	{
		$types = Post::list_active_post_types();
		if ( is_numeric( $name ) && ( FALSE !== in_array( $name, $types ) ) ) {
			return $name;
		}
		if ( isset( $types[strtolower( $name )] ) ) {
			return $types[strtolower( $name )];
		}
		return false;
	}

	/**
	 * returns the friendly name of a post type, or null
	 * @param mixed a post type number, or name
	 * @return mixed a string of the post type, or null
	**/
	public static function type_name( $type )
	{
		$types = array_flip( Post::list_active_post_types() );
		if ( is_numeric( $type ) && isset( $types[$type] ) ) {
			return $types[$type];
		}
		if ( FALSE !== in_array( $type, $types ) ) {
			return $type;
		}
		return '';
	}

	/**
	 * inserts a new post type into the database, if it doesn't exist
	 * @param string The name of the new post type
	 * @param bool Whether the new post type is active or not
	 * @return none
	**/
	public static function add_new_type( $type, $active = true )
	{
		// refresh the cache from the DB, just to be sure
		$types = self::list_all_post_types( true );

		if ( ! array_key_exists( $type, $types ) ) {
			// Doesn't exist in DB.. add it and activate it.
			DB::query( 'INSERT INTO {posttype} (name, active) VALUES (?, ?)', array( $type, $active ) );
		}
		elseif ( $types[$type]['active'] == 0 ) {
			// Isn't active so we activate it
			self::activate_post_type( $type );
		}
		ACL::create_token( 'post_' . Utils::slugify($type), _t('Permissions to posts of type "%s"', array($type) ), _t('Content'), TRUE );

		// now force a refresh of the caches, so the new/activated type
		// is available for immediate use
		$types = self::list_active_post_types( true );
		$types = self::list_all_post_types( true );
	}

	/**
	 * inserts a new post status into the database, if it doesn't exist
	 * @param string The name of the new post status
	 * @param bool Whether this status is for internal use only.  If true,
	 *	this status will NOT be presented to the user
	 * @return none
	**/
	public static function add_new_status( $status, $internal = false )
	{
		// refresh the cache from the DB, just to be sure
		$statuses = self::list_post_statuses( true );
		if ( ! array_key_exists( $status, $statuses ) ) {
			// let's make sure we only insert an integer
			$internal = intval( $internal );
			DB::query( 'INSERT INTO {poststatus} (name, internal) VALUES (?, ?)', array( $status, $internal ) );
			// force a refresh of the cache, so the new status
			// is available for immediate use
			$statuses = self::list_post_statuses( true, true );
		}
	}

	/**
	 * Return the defined database columns for a Post.
	 * @return array Array of columns in the Post table
	**/
	public static function default_fields()
	{
		return array(
			'id' => 0,
			'slug' => '',
			'title' => '',
			'guid' => '',
			'content' => '',
			'cached_content' => '',
			'user_id' => 0,
			'status' => Post::status( 'draft' ),
			'pubdate' => HabariDateTime::date_create(),
			'updated' => HabariDateTime::date_create(),
			'modified' => HabariDateTime::date_create(),
			'content_type' => Post::type( 'entry' )
		);
	}

	/**
	 * Constructor for the Post class.
	 * @param array $paramarray an associative array of initial Post field values.
	 **/
	public function __construct( $paramarray = array() )
	{
		// Defaults
		$this->fields = array_merge(
			self::default_fields(),
			$this->fields,
			$this->newfields
		);

		parent::__construct( $paramarray );
		if ( isset( $this->fields['tags'] ) ) {
			$this->tags = $this->parsetags( $this->fields['tags'] );
			unset( $this->fields['tags'] );
		}

		$this->exclude_fields( 'id' );
		$this->info = new PostInfo ( $this->fields['id'] );
		 /* $this->fields['id'] could be null in case of a new post. If so, the info object is _not_ safe to use till after set_key has been called. Info records can be set immediately in any other case. */
	}

	/**
	 * Return a single requested post.
	 *
	 * <code>
	 * $post= Post::get( array( 'slug' => 'wooga' ) );
	 * </code>
	 *
	 * @param array $paramarray An associated array of parameters, or a querystring
	 * @return Post The first post that matched the given criteria
	 **/
	static function get( $paramarray = array() )
	{
		// Defaults
		$defaults = array (
			'where' => array(
				array(
					'status' => Post::status( 'published' ),
				),
			),
			'fetch_fn' => 'get_row',
		);
		foreach ( $defaults['where'] as $index => $where ) {
			$defaults['where'][$index] = array_merge( $where, Utils::get_params( $paramarray ) );
		}
		// make sure we get at most one result
		$defaults['limit'] = 1;

		return Posts::get( $defaults );
	}

	/**
	 * Create a post and save it.
	 *
	 * @param array $paramarray An associative array of post fields
	 * @return Post The new Post object
	 **/
	static function create( $paramarray )
	{
		$post = new Post( $paramarray );
		$post->insert();
		return $post;
	}

	/**
	 * Generate a new slug for the post.
	 *
	 * @return string The slug
	 */
	private function setslug()
	{
		// determine the base value from:
		// - the new slug
		if ( isset( $this->newfields['slug']) && $this->newfields['slug'] != '' ) {
			$value = $this->newfields['slug'];
		}
		// - the existing slug
		elseif ( $this->fields['slug'] != '' ) {
			$value = $this->fields['slug'];
		}
		// - the new post title
		elseif ( isset( $this->newfields['title'] ) && $this->newfields['title'] != '' ) {
			$value = $this->newfields['title'];
		}
		// - the existing post title
		elseif ( $this->fields['title'] != '' ) {
			$value = $this->fields['title'];
		}
		// - default
		else {
			$value = 'Post';
		}

		// make sure our slug is unique
		$slug = Plugins::filter( 'post_setslug', $value );
		$slug = Utils::slugify( $slug );
		$postfix = '';
		$postfixcount = 0;
		do {
			if ( ! $slugcount = DB::get_row( 'SELECT COUNT(slug) AS ct FROM {posts} WHERE slug = ?;', array( $slug . $postfix ) ) ) {
				Utils::debug( DB::get_errors() );
				exit;
			}
			if ( $slugcount->ct != 0 ) {
				$postfix = "-" . ( ++$postfixcount );
			}
		} while ( $slugcount->ct != 0 );

		return $this->newfields['slug'] = $slug . $postfix;
	}

	/**
	 * Generate the GUID for the new post.
	 */
	private function setguid()
	{
		if ( ! isset( $this->newfields['guid'] )
			|| ( $this->newfields['guid'] == '' )  // GUID is empty
			|| ( $this->newfields['guid'] == '//?p=' ) // GUID created by WP was erroneous (as is too common)
		) {
			$result = 'tag:' . Site::get_url( 'hostname' ) . ',' . date( 'Y' ) . ':' . $this->setslug() . '/' . time();
			$this->newfields['guid'] = $result;
		}
		return $this->newfields['guid'];
	}

	/**
	 * function setstatus
	 * @param mixed the status to set it to. String or integer.
	 * @return integer the status of the post
	 * Sets the status for a post, given a string or integer.
	 */
	private function setstatus( $value )
	{
		$statuses = Post::list_post_statuses();
		if ( is_numeric( $value ) && in_array( $value, $statuses ) ) {
			return $this->newfields['status'] = $value;
		}
		elseif ( array_key_exists( $value, $statuses ) ) {
			return $this->newfields['status'] = Post::status( 'publish' );
		}

		return false;
	}

	private static function parsetags( $tags )
	{
		if ( is_string( $tags ) ) {
			if ( '' === $tags ) {
				return array();
			}
			// dirrty ;)
			$rez = array( '\\"'=>':__unlikely_quote__:', '\\\''=>':__unlikely_apos__:' );
			$zer = array( ':__unlikely_quote__:'=>'"', ':__unlikely_apos__:'=>"'" );
			// escape
			$tagstr = str_replace( array_keys( $rez ), $rez, $tags );
			// match-o-matic
			preg_match_all( '/((("|((?<= )|^)\')\\S([^\\3]*?)\\3((?=[\\W])|$))|[^,])+/', $tagstr, $matches );
			// cleanup
			$tags = array_map( 'trim', $matches[0] );
			$tags = preg_replace( array_fill( 0, count( $tags ), '/^(["\'])(((?!").)+)(\\1)$/'), '$2', $tags );
			// unescape
			$tags = str_replace( array_keys( $zer ), $zer, $tags );
			// hooray
			return $tags;
		}
		elseif ( is_array( $tags ) ) {
			return $tags;
		}
	}

	/**
	 * Save the tags associated to this post into the tags and tags2post tables
	 */
	private function save_tags()
	{
		/*
		 * First, let's clean the incoming tag text array, ensuring we have
		 * a unique set of tag texts and slugs.
		 */
		$tag_ids_to_post = $clean_tags = array();
		foreach ( ( array ) $this->tags as $tag )
			if ( ! in_array( $tag, array_keys( $clean_tags ) ) )
				if ( ! in_array( $slug = Utils::slugify( $tag ), array_values( $clean_tags ) ) )
					$clean_tags[$tag] = $slug;

		/* Now, let's insert any *new* tag texts or slugs into the tags table */
		$placeholders = Utils::placeholder_string( count($clean_tags) );
		$sql_tags_exist = "SELECT id, tag_text, tag_slug
			FROM {tags}
			WHERE tag_text IN ({$placeholders})
			OR tag_slug IN ({$placeholders})";
		$params = array_merge( array_keys( $clean_tags ), array_values( $clean_tags ) );
		$existing_tags = DB::get_results( $sql_tags_exist, $params );
		if ( count( $existing_tags ) > 0 ) {
			/* Tags exist which match the text or the slug */
			foreach ( $existing_tags as $existing_tag ) {
				/*
				 * Tag exists.
				 * Attach post to tag, then remove tag from creation list.
				 */
				Tag::attach_to_post( $existing_tag->id, $this->fields['id'] );
				$tag_ids_to_post[] = $existing_tag->id;

				/*
				 * We remove it from the clean_tags collection as we only
				 * want to add to the tags table those tags which don't already exist
				 */
				if ( in_array( $existing_tag->tag_text, array_keys( $clean_tags ) ) ) {
					unset( $clean_tags[$existing_tag->tag_text] );
				}
				if ( in_array( $existing_tag->tag_slug, array_values( $clean_tags ) ) ) {
					foreach ( $clean_tags as $text=>$slug ) {
						if ( $slug == $existing_tag->tag_slug ) {
							unset( $clean_tags[$text] );
							break;
						}
					}
				}
			}
		}

//		DB::begin_transaction();
		/*
		 * $clean_tags now contains an associative array of tags
		 * we need to add to the main tags table.
		 *
		 * Let's add the new tags to the tags table...
		 */
		foreach ( $clean_tags as $new_tag_text=>$new_tag_slug ) {
			$tag = Tag::create( array( 'tag_text' => $new_tag_text, 'tag_slug' => $new_tag_slug ) );
			Tag::attach_to_post( $tag->id, $this->fields['id'] );
			$tag_ids_to_post[]= $tag->id;
		}

		/*
		 * Finally, remove the tags which are no longer associated with the
		 * post.
		 */
		$repeat_questions = Utils::placeholder_string( count($tag_ids_to_post) );
		$sql_delete = "SELECT tag_id FROM {tag2post} WHERE post_id = ? AND tag_id NOT IN ({$repeat_questions})";
		$params = array_merge( (array) $this->fields['id'], array_values( $tag_ids_to_post ) );

		$result = DB::get_results( $sql_delete, $params );

		foreach ( $result as $t ) {
			Tag::detatch_from_post( $t->tag_id, $this->fields['id'] );
		}

//		DB::commit();
		return TRUE;

	}

	/**
	 * function insert
	 * Saves a new post to the posts table
	 */
	public function insert()
	{
		$this->newfields['updated'] = HabariDateTime::date_create();
		$this->newfields['modified'] = $this->newfields['updated'];
		$this->setguid();

		$allow = true;
		$allow = Plugins::filter( 'post_insert_allow', $allow, $this );
		if ( ! $allow ) {
			return;
		}
		Plugins::act( 'post_insert_before', $this );

		// Invoke plugins for all fields, since they're all "changed" when inserted
		foreach ( $this->fields as $fieldname => $value ) {
			Plugins::act( 'post_update_' . $fieldname, $this, ( $this->id == 0 ) ? null : $value, $this->$fieldname );
		}
		// invoke plugins for status changes
		Plugins::act( 'post_status_' . self::status_name( $this->status ), $this, null );

		$result = parent::insertRecord( DB::table( 'posts' ) );
		$this->newfields['id'] = DB::last_insert_id(); // Make sure the id is set in the post object to match the row id
		$this->fields = array_merge( $this->fields, $this->newfields );
		$this->newfields = array();
		$this->info->commit( DB::last_insert_id() );
		$this->save_tags();
		$this->create_default_permissions();
		EventLog::log( sprintf(_t('New post %1$s (%2$s);  Type: %3$s; Status: %4$s'), $this->id, $this->slug, Post::type_name( $this->content_type ), $this->statusname), 'info', 'content', 'habari' );
		Plugins::act( 'post_insert_after', $this );

		//scheduled post
		if( $this->status == Post::status( 'scheduled' ) ) {
			Posts::update_scheduled_posts_cronjob();
		}

		return $result;
	}

	/**
	 * function update
	 * Updates an existing post in the posts table
	 * @param bool $minor Indicates if this is a major or minor update
	 */
	public function update( $minor = true )
	{
		$this->modified = HabariDateTime::date_create();
		if ( ! $minor ) {
			$this->updated = $this->modified;
		}
		if ( isset( $this->fields['guid'] ) ) {
			unset( $this->newfields['guid'] );
		}

		$allow = true;
		$allow = Plugins::filter( 'post_update_allow', $allow, $this );
		if ( ! $allow ) {
			return;
		}
		Plugins::act( 'post_update_before', $this );

		// Call setslug() only when post slug is changed
		if ( isset( $this->newfields['slug'] ) && $this->newfields['slug'] != '' ) {
			if ( $this->fields['slug'] != $this->newfields['slug'] ) {
				$this->setslug();
			}
		}

		// invoke plugins for all fields which have been changed
		// For example, a plugin action "post_update_status" would be
		// triggered if the post has a new status value
		foreach ( $this->newfields as $fieldname => $value ) {
			Plugins::act( 'post_update_' . $fieldname, $this, $this->fields[$fieldname], $value );
		}

		// invoke plugins for status changes
		if ( isset( $this->newfields['status'] ) && $this->fields['status'] != $this->newfields['status'] ) {
		  Plugins::act( 'post_status_' . self::status_name( $this->newfields['status'] ), $this, $this->fields['status'] );
		}

		$result = parent::updateRecord( DB::table( 'posts' ), array( 'id' => $this->id ) );

		//scheduled post
		if ( $this->fields['status'] == Post::status( 'scheduled' ) || $this->status == Post::status( 'scheduled' ) ) {
			Posts::update_scheduled_posts_cronjob();
		}

		$this->fields = array_merge( $this->fields, $this->newfields );
		$this->newfields = array();
		$this->save_tags();
		$this->info->commit();
		Plugins::act( 'post_update_after', $this );
		return $result;
	}

	/**
	 * function delete
	 * Deletes an existing post
	 */
	public function delete()
	{
		$allow = true;
		$allow = Plugins::filter( 'post_delete_allow', $allow, $this );
		if ( ! $allow ) {
			return;
		}
		// invoke plugins
		Plugins::act( 'post_delete_before', $this );

		// delete all the tags associated with this post
		foreach ( $this->get_tags() as $tag_slug => $tag_text ) {
			$tag = Tags::get_by_slug( $tag_slug );
			Tag::detatch_from_post( $tag->id, $this->id );
		}

		// Delete all comments associated with this post
		if ( $this->comments->count() > 0 ) {
			$this->comments->delete();
		}
		// Delete all info records associated with this post
		if ( isset( $this->info ) ) {
			$this->info->delete_all();
		}
		// Delete all permissions associated with this post
		$this->delete_permissions();

		$result = parent::deleteRecord( DB::table( 'posts' ), array( 'slug'=>$this->slug ) );
		EventLog::log( sprintf(_t('Post %1$s (%2$s) deleted.'), $this->id, $this->slug), 'info', 'content', 'habari' );

		//scheduled post
		if( $this->status == Post::status( 'scheduled' ) ) {
			Posts::update_scheduled_posts_cronjob();
		}

		// invoke plugins on the after_post_delete action
		Plugins::act( 'post_delete_after', $this );
		return $result;
	}

	/**
	 * function publish
	 * Updates an existing post to published status
	 * @return boolean True on success, false if not
	 */
	public function publish()
	{
		if ( $this->status == Post::status( 'published' ) ) {
			return true;
		}
		$allow = true;
		$allow = Plugins::filter( 'post_publish_allow', $allow, $this );
		if ( ! $allow ) {
			return;
		}
		Plugins::act( 'post_publish_before', $this );

		if ( $this->status != Post::status( 'scheduled' ) )  {
			$this->pubdate = HabariDateTime::date_create();
		}

		if ( $this->status == Post::status( 'scheduled' ) ) {
			$this->get_tags();
			$msg = sprintf(_t('Scheduled Post %1$s (%2$s) published at %3$s.'), $this->id, $this->slug, $this->pubdate->format());
		}
		else {
			$msg = sprintf(_t('Post %1$s (%2$s) published.'), $this->id, $this->slug);
		}

		$this->status = Post::status( 'published' );
		$result = $this->update( false );
		EventLog::log( $msg, 'info', 'content', 'habari' );

		// and call any final plugins
		Plugins::act( 'post_publish_after', $this );
		return $result;
	}

	/**
	 * function __get
	 * Overrides QueryRecord __get to implement custom object properties
	 * @param string Name of property to return
	 * @return mixed The requested field value
	 **/
	public function __get( $name )
	{
		$fieldnames = array_merge( array_keys( $this->fields ), array( 'permalink', 'tags', 'comments', 'comment_count', 'comment_feed_link', 'author', 'editlink' ) );
		if ( !in_array( $name, $fieldnames ) && strpos( $name, '_' ) !== false ) {
			preg_match( '/^(.*)_([^_]+)$/', $name, $matches );
			list( $junk, $name, $filter )= $matches;
		}
		else {
			$filter = false;
		}

		switch( $name ) {
		case 'statusname':
			$out = self::status_name( $this->status );
			break;
		case 'typename':
			$out = self::type_name( $this->content_type );
			break;
		case 'permalink':
			$out = $this->get_permalink();
			break;
		case 'editlink':
			$out = $this->get_editlink();
			break;
		case 'tags':
			$out = $this->get_tags();
			break;
		case 'comments':
			$out = $this->get_comments();
			break;
		case 'comment_count':
			$out = $this->get_comments()->count();
			break;
		case 'comment_feed_link':
			$out = $this->get_comment_feed_link();
			break;
		case 'author':
			$out = $this->get_author();
			break;
		case 'info':
			$out = $this->get_info();
			break;
		default:
			$out = parent::__get( $name );
			break;
		}
		$out = Plugins::filter( "post_get", $out, $name, $this );
		$out = Plugins::filter( "post_{$name}", $out, $this );
		if ( $filter ) {
			$out = Plugins::filter( "post_{$name}_{$filter}", $out, $this );
		}
		return $out;
	}

	/**
	 * function __set
	 * Overrides QueryRecord __get to implement custom object properties
	 * @param string Name of property to return
	 * @return mixed The requested field value
	 **/
	public function __set( $name, $value )
	{
		switch( $name ) {
		case 'pubdate':
		case 'updated':
		case 'modified':
			if ( !($value instanceOf HabariDateTime) ) {
				$value = HabariDateTime::date_create($value);
			}
			break;
		case 'tags':
			return $this->tags = $this->parsetags( $value );
		case 'status':
			return $this->setstatus( $value );
		}
		return parent::__set( $name, $value );
	}

	/**
	 * Handle calls to this Post object that are implemented by plugins
	 * @param string $name The name of the function called
	 * @param array $args Arguments passed to the function call
	 * @return mixed The value returned from any plugin filters, null if no value is returned
	 **/
	public function __call( $name, $args )
	{
		array_unshift($args, 'post_call_' . $name, null, $this);
		return call_user_func_array(array('Plugins', 'filter'), $args);
	}

	/**
	 * Returns a form for editing this post
	 * @param string $context The context the form is being created in, most often 'admin'
	 * @return FormUI A form appropriate for creating and updating this post.
	 **/
	public function get_form($context)
	{
		$form = new FormUI('create-content');
		$form->class[] = 'create';

		$newpost = ( 0 === $this->id );

		// If the post has already been saved, add a link to its permalink
		if ( !$newpost ) {
			$post_links = $form->append('wrapper', 'post_links');
			$permalink = ( $this->status != Post::status( 'published' ) ) ? $this->permalink . '?preview=1' : $this->permalink;
			$post_links->append('static', 'post_permalink', '<a href="'. $permalink .'" class="viewpost" >'.( $this->status != Post::status('published') ? _t('Preview Post') : _t('View Post') ).'</a>');
			$post_links->class ='container';
		}

		// Create the Title field
		$form->append('text', 'title', 'null:null', _t('Title'), 'admincontrol_text');
		$form->title->class = 'important';
		$form->title->tabindex = 1;
		$form->title->value = $this->title;

		// Create the silos
		if ( count( Plugins::get_by_interface( 'MediaSilo' ) ) ) {
			$form->append('silos', 'silos');
			$form->silos->silos = Media::dir();
		}

		// Create the Content field
		$form->append('textarea', 'content', 'null:null', _t('Content'), 'admincontrol_textarea');
		$form->content->class[] = 'resizable';
		$form->content->tabindex = 2;
		$form->content->value = $this->content;
		$form->content->raw = true;

		// Create the tags field
		$form->append('text', 'tags', 'null:null', _t('Tags, separated by, commas'), 'admincontrol_text');
		$form->tags->tabindex = 3;
		$form->tags->value = implode(', ', $this->get_tags());

		// Create the splitter
		$publish_controls = $form->append('tabs', 'publish_controls');

		// Create the publishing controls
		// pass "false" to list_post_statuses() so that we don't include internal post statuses
		$statuses = Post::list_post_statuses( $this );
		unset( $statuses[array_search( 'any', $statuses )] );
		$statuses = Plugins::filter( 'admin_publish_list_post_statuses', $statuses );

		$settings = $publish_controls->append('fieldset', 'settings', _t('Settings'));

		$settings->append('select', 'status', 'null:null', _t('Content State'), array_flip($statuses), 'tabcontrol_select');
		$settings->status->value = $this->status;

		// hide the minor edit checkbox if the post is new
		if ( $newpost ) {
			$settings->append('hidden', 'minor_edit', 'null:null');
			$settings->minor_edit->value = false;
		}
		else {
			$settings->append('checkbox', 'minor_edit', 'null:null', _t('Minor Edit'), 'tabcontrol_checkbox');
			$settings->minor_edit->value = true;
			$form->append('hidden', 'modified', 'null:null')->value = $this->modified;
		}

		$settings->append('checkbox', 'comments_enabled', 'null:null', _t('Comments Allowed'), 'tabcontrol_checkbox');
		$settings->comments_enabled->value = $this->info->comments_disabled ? false : true;

		$settings->append('text', 'pubdate', 'null:null', _t('Publication Time'), 'tabcontrol_text');
		$settings->pubdate->value = $this->pubdate->format('Y-m-d H:i:s');

		$settings->append('text', 'newslug', 'null:null', _t('Content Address'), 'tabcontrol_text');
		$settings->newslug->value = $this->slug;

		// Create the button area
		$buttons = $form->append('fieldset', 'buttons');
		$buttons->template = 'admincontrol_buttons';
		$buttons->class[] = 'container';
		$buttons->class[] = 'buttons';
		$buttons->class[] = 'publish';

		// Create the Save button
		$require_any = array( 'own_posts' => 'create', 'post_any' => 'create', 'post_' . Post::type_name( $this->content_type ) => 'create' );
		if( ( $newpost && User::identify()->can_any( $require_any ) ) || ( !$newpost && ACL::access_check( $this->get_access(), 'edit' ) ) ) {
			$buttons->append('submit', 'save', _t('Save'), 'admincontrol_submit');
			$buttons->save->tabindex = 4;
		}

		// Add required hidden controls
		$form->append('hidden', 'content_type', 'null:null');
		$form->content_type->value = $this->content_type;
		$form->append('hidden', 'post_id', 'null:null');
		$form->post_id->id = 'id';
		$form->post_id->value = $this->id;
		$form->append('hidden', 'slug', 'null:null');
		$form->slug->value = $this->slug;

		// Let plugins alter this form
		Plugins::act('form_publish', $form, $this, $context);

		// Return the form object
		return $form;
	}


	/**
	 * Returns a URL for the ->permalink property of this class.
	 * @return string A URL to this post.
	 * @todo separate permalink rule?  (Not sure what this means - OW)
	 **/
	private function get_permalink()
	{
		$content_type = Post::type_name( $this->content_type );
		return URL::get(
			array(
				"display_{$content_type}",
				"display_post"
			),
			$this,
			false
		);
	}

	/**
	 * Returns a URL for the ->editlink property of this class.
	 * @return string A url to edit this post in the admin.
	 **/
	private function get_editlink()
	{
		return URL::get('admin', 'page=publish&id=' . $this->id);
	}

	/**
	 * function get_tags
	 * Gets the tags for the post
	 * @return &array A reference to the tags array for this post
	 **/
	private function get_tags()
	{
		if ( empty( $this->tags ) ) {
			$sql = "
				SELECT t.tag_text, t.tag_slug
				FROM {tags} t
				INNER JOIN {tag2post} t2p
				ON t.id = t2p.tag_id
				WHERE t2p.post_id = ?
				ORDER BY t.tag_text ASC";
			$result = DB::get_results( $sql, array( $this->fields['id'] ) );
			if ( $result ) {
				foreach ( $result as $t ) {
					$this->tags[$t->tag_slug] = $t->tag_text;
				}
			}
		}
		if ( count( $this->tags ) == 0 ) {
			return array();
		}
		return $this->tags;
	}

	/**
	 * function get_comments
	 * Gets the comments for the post
	 * @return &array A reference to the comments array for this post
	**/
	private function &get_comments()
	{
		if ( ! $this->comments_object ) {
			$this->comments_object = Comments::by_post_id( $this->id );
		}
		return $this->comments_object;
	}

	/**
	 * private function get_comment_feed_link
	 * Returns the permalink for this post's comments Atom feed
	 * @return string The permalink of this post's comments Atom feed
	**/
	private function get_comment_feed_link()
	{
		$content_type = Post::type_name( $this->content_type );
		return URL::get( array( "atom_feed_{$content_type}_comments" ), $this, false );
	}

	/**
	 * function get_info
	 * Gets the info object for this post, which contains data from the postinfo table
	 * related to this post.
	 * @return PostInfo object
	**/
	private function get_info()
	{
		if ( ! $this->info ) {
			// If this post isn't in the database yet...
			if ( $this->id == 0 ) {
				$this->info = new PostInfo();
			}
			else {
				$this->info = new PostInfo( $this->id );
			}
		}
		return $this->info;
	}

	/**
	 * private function get_author()
	 * returns a User object for the author of this post
	 * @return User a User object for the author of the current post
	**/
	private function get_author()
	{
		if ( ! isset( $this->author_object ) ) {
			// XXX for some reason, user_id is a string sometimes?
			$this->author_object = User::get_by_id( $this->user_id );
		}
		return $this->author_object;
	}

	/**
	 * Returns a set of properties used by URL::get to create URLs
	 * @return array Properties of this post used to build a URL
	 */
	public function get_url_args()
	{
		if ( !$this->url_args ) {
			$arr = array( 'content_type_name' => Post::type_name( $this->content_type ) );
			$author = URL::extract_args( $this->author, 'author_' );
			$info = URL::extract_args( $this->info, 'info_' );
			$this->url_args = array_merge( $author, $info, $arr, $this->to_array(), $this->pubdate->getdate() );
		}
		return $this->url_args;
	}

	/**
	 * Returns the ascending post, relative to this post, according to params
	 * @params The params by which to work out what is the ascending post
	 * @return Post The ascending post
	 */
	public function ascend($params = null)
	{
		return Posts::ascend($this, $params);
	}

	/**
	 * Returns the descending post, relative to this post, according to params
	 * @params The params by which to work out what is the descending post
	 * @return Post The descending post
	 */
	public function descend($params = null)
	{
		return Posts::descend($this, $params);
	}

	/**
	 * Return the content type of this object
	 *
	 * @return array An array of content types that this object represents, starting with the most specific
	 * @see IsContent
	 */
	public function content_type()
	{
		return array(Post::type_name($this->content_type), 'Post');
	}

	/**
	 * Adds the default tokens to this post when it's saved
	 */
	public function create_default_tokens()
	{
		$tokens = array();
		$tokens = Plugins::filter('post_tokens', $tokens, $this);
		$this->add_tokens( $this->content_type() );
	}


	/**
	 * Checks if this post has one or more tokens
	 *
	 * @param mixed $tokens A single token string or an array of tokens
	 * @return mixed false if no tokens match, an array of matching token ids if any match
	 */
	public function has_tokens( $tokens )
	{
		$this->get_tokens();
		$tokens = Utils::single_array( $tokens );
		$tokens = array_map(array('ACL', 'token_id'), $tokens);
		$tokens = array_intersect($tokens, $this->tokens);
		if(count($tokens) == 0) {
			return false;
		}
		return $tokens;
	}

	/**
	 * Add a token to a post
	 * @param mixed $token The name of the permission to add, or an array of permissions to add
	 **/
	public function add_tokens( $tokens )
	{
		$this->get_tokens();
		$tokens = Utils::single_array( $tokens );
		$tokens = array_map(array('ACL', 'token_id'), $tokens);
		$add_tokens = array_diff($tokens, $this->tokens);
		$add_tokens = array_unique($add_tokens);
		foreach($add_tokens as $token_id) {
			DB::insert( '{post_tokens}', array( 'post_id' => $this->id, 'token_id' => $token_id ) );
		}
		$this->tokens = array_merge($this->tokens, $add_tokens);
		$this->tokens = array_unique($this->tokens);
	}

	/**
	 * Deletes tokens from a post
	 * @param mixed $token The name of the permission to remove, or an array of permissions to remove
	 */
	public function remove_tokens( $tokens )
	{
		$this->get_tokens();
		$tokens = Utils::single_array( $tokens );
		$tokens = array_map(array('ACL', 'token_id'), $tokens);
		$remove_tokens = array_intersect($tokens, $this->tokens);
		foreach($remove_tokens as $token_id) {
			DB::delete( '{post_tokens}', array( 'post_id' => $this->id, 'token_id' => $token_id ) );
		}
		$this->tokens = array_diff($this->tokens, $remove_tokens);
	}

	/**
	 * Applies a new set of specific tokens to a post
	 * @param mixed $tokens A string token, or an array of tokens to apply to this post
	 */
	public function set_tokens( $tokens )
	{
		$tokens = Utils::single_array( $tokens );
		$new_tokens = array_map(array('ACL', 'token_id'), $tokens);
		$new_tokens = array_unique($new_tokens);
		DB::delete( '{post_tokens}', array( 'post_id' => $this->id ) );
		foreach($new_tokens as $token_id) {
			DB::insert( '{post_tokens}', array( 'post_id' => $this->id, 'token_id' => $token_id ) );
		}
		$this->tokens = $new_tokens;
	}

	/**
	 * Returns an array of token ids that are associated with this post
	 * Also initializes the internal token array for use by other token operations
	 *
	 * @return array An array of token ids
	 */
	public function get_tokens()
	{
		if ( empty( $this->tokens ) ) {
			$this->tokens = DB::get_column( 'SELECT token_id FROM {post_tokens} WHERE post_id = ?', array($this->id) );
		}
		return $this->tokens;
	}

	/**
	 * Returns an access Bitmask for the given user on this post
	 * @param User $user The user mask to fetch
	 * @return Bitmask
	 */
	public function get_access( $user = null )
	{
		if ( ! $user instanceof User ) {
			$user = User::identify();
		}

		if( $user->can( 'super_user' ) ) {
			return ACL::get_bitmask( 'full' );
		}

		// Collect a list of applicable tokens
		$tokens = array(
			'post_any',
			'post_' . Post::type_name( $this->content_type ),
		);

		if( $user->id == $this->user_id) {
			$tokens[] = 'own_posts';
		}

		$tokens = array_merge($tokens, $this->get_tokens());
		
		// collect all possible token accesses on this post
		$token_accesses = array();
		foreach ( $tokens as $token ) {
			$access = ACL::get_user_token_access( $user, $token );
			if ( $access instanceof Bitmask ) {
				$token_accesses[] = ACL::get_user_token_access( $user, $token )->value;
			}
		}

		// now that we have all the accesses, loop through them to build the access to the particular post
		if ( in_array( 0, $token_accesses ) ) {
			return ACL::get_bitmask( 0 );
		}
		return ACL::get_bitmask( Utils::array_or( $token_accesses ) );
	}

}
?>