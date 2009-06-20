<?php
/**
 * FadeIn Habari Theme
 * @author Firman Wandayandi
 * @url http://firmanw.com/habari-theme-fadein
 */

// Tell Habari which class to be use as the custom theme class:
define( 'THEME_CLASS', 'FadeIn' );

class FadeIn extends Theme
{
	/**
	 * Number of previously items to display.
	 */
	const PREVIOUSLY_ITEMS = 5;

	/**
	 * Number of latest items to display.
	 */
	const LATEST_ITEMS = 5;

	/**
	 * Execute on theme init to apply these filters to output
	 */
	public function action_init_theme()
	{
		// Apply Format::autop() to post content
		Format::apply( 'autop', 'post_content_out' );

		// Apply Format::autop() to comment content
		Format::apply( 'autop', 'comment_content_out' );

		// Apply Format::nice_date() to post date...
		Format::apply( 'nice_date', 'post_pubdate_out', 'j-M-Y' );

		// Apply Format::nice_date() to post date time...
		Format::apply( 'nice_date', 'post_pubdate_time', '\a\t g:ia' );

		// Apply Format::nice_date() to post date excerpt...
        Format::apply( 'nice_date', 'post_pubdate_excerpt', 'l, F jS, Y' );

		// Apply Format::nice_date() to comment date...
		//Format::apply( 'nice_date', 'comment_date', 'l, F jS, Y \a\t g:ia' );

		// Truncate content excerpt at "more" or 56 characters...
		Format::apply_with_hook_params( 'more', 'post_content_excerpt', '', 256, 1 );
	}

	/**
	 * Add some variables to the template output
	 */
	public function add_template_vars()
	{
		if( !$this->template_engine->assigned( 'pages' ) ) {
			$this->assign('pages', Posts::get( array( 'content_type' => 'page', 'status' => Post::status('published'), 'nolimit' => 1 ) ) );
		}

		$page = Controller::get_var( 'page' );
		$page = isset ( $page ) ? $page : 1;
		if( !$this->template_engine->assigned( 'page' ) ) {
			$this->assign('page', $page );
		}

		$this->assign( 'show_previously', false );
		$this->assign( 'show_latest', false );
		$action = Controller::get_action();
		if ($action == 'display_home' || $action == 'display_entries') {
			$offset = (int) ( ( ( $page + 1 ) - 1 ) * Options::get('pagination') );
			$this->assign( 'previously', Posts::get(array ( 'status' => 'published','content_type' => 'entry', 'offset' => $offset, 'limit' => self::PREVIOUSLY_ITEMS ) ) );
			$this->assign( 'show_previously', true );
		}

		if ($action != 'display_home') {
			$this->assign( 'latest', Posts::get(array ( 'status' => 'published','content_type' => 'entry', 'offset' => 0, 'limit' => self::LATEST_ITEMS ) ) );
			$this->assign( 'show_latest', true );
		}

		$this->assign('controller_action', $action);

		parent::add_template_vars();
	}

	/**
	 * Convert a post's tags array into a usable list of links
	 *
	 * @param array $array The tags array from a Post object
	 * @return string The HTML of the linked tags
	 */
	public function filter_post_tags_out($array)
	{
		if ( ! is_array( $array ) ) {
			$array = array ( $array );
		}
		$fn = create_function('$a,$b', 'return "<li><a href=\\"" . URL::get("display_entries_by_tag", array( "tag" => $b) ) . "\\" rel=\\"tag\\">" . $a . "</a></li>\n";');
		$array = array_map($fn, $array, array_keys($array));
		$out = '<ul>' . implode('', $array) . '</ul>';
		return $out;
 	}

	public function theme_search_prompt( $theme, $criteria, $has_results )
	{
		$out=array();
		$keywords=explode(' ',trim($criteria));
		foreach ($keywords as $keyword) {
			$out[]= '<a href="' . Site::get_url( 'habari', true ) .'search?criteria=' . $keyword . '" title="' . _t( 'Search for ' ) . $keyword . '">' . $keyword . '</a>';
		}

		if ( sizeof( $keywords ) > 1 ) {
			if ( $has_results ) {
				return sprintf( _t( 'Your search for "<b>%s</b>".' ), implode(' ',$out) );
				exit;
			}
			return sprintf( _t('No results found for your search \'%1$s\'') . '<br>'. _t('You can try searching for \'%2$s\''), $criteria, implode('\' or \'',$out) );
		}
		else {
			return sprintf( _t( 'Search results for "<b>%s</b>".' ), $criteria );
			exit;
		}
		return sprintf( _t( 'Your search for "<b>%s</b>".' ), $criteria );

	}

	/**
	 * Returns an unordered list of all used Tags
	 */
	public function theme_show_tags ( $theme )
	{
		$sql ="
			SELECT t.tag_slug AS slug, t.tag_text AS text, count(tp.post_id) as ttl
			FROM {tags} t
			INNER JOIN {tag2post} tp
			ON t.id=tp.tag_id
			INNER JOIN {posts} p
			ON p.id=tp.post_id AND p.status = ?
			GROUP BY t.tag_slug
			ORDER BY t.tag_text
		";
		$tags = DB::get_results( $sql, array(Post::status('published')) );

		foreach ($tags as $index => $tag) {
			$tags[$index]->url = URL::get( 'display_entries_by_tag', array( 'tag' => $tag->slug ) );
		}
		$theme->taglist = $tags;

		return $theme->fetch( 'taglist' );
	}
}
?>