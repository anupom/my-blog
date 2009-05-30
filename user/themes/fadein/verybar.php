<?php
// Warning: This is PHP template written as RAW.
?>
<?php // Do not delete these lines
	if ( ! defined('HABARI_PATH' ) ) { die( _t('Please do not load this page directly. Thanks!') ); }
?>
<div id="verybar" class="col3 line3">
	<div id="feed">
		<ul>
			<li><a href="<?php URL::out( 'atom_feed', array( 'index' => '1' ) ); ?>"><?php _e( "Entries" ); ?></a></li>
			<li><a href="<?php URL::out( 'atom_feed_comments' ); ?>"><?php _e( "Comments" ); ?></a></li>
		</ul>
	</div>
	<div><a href="http://habariproject.org/" id="habari_powered" title="Habari">Habari</a></div>
	<div id="login">
		<?php if ( isset( $user ) && ( $user instanceOf User ) ): ?>
			<?php _e('You are logged in as'); ?> <a href="<?php URL::out( 'admin', 'page=user&user=' . $user->username ) ?>" title="<?php _e('Edit Your Profile'); ?>"><?php echo $user->username; ?></a>.
			<?php _e('Want to'); ?> <a href="<?php Site::out_url( 'habari' ); ?>/user/logout"><?php _e('Log out'); ?></a>?
		<?php else: ?>
			<?php _e('You haven\'t logged in. Bring me to'); ?> <a href="<?php Site::out_url( 'habari' ); ?>/admin"><?php _e('Login page'); ?></a>.
		<?php endif; ?>
	</div>
</div>