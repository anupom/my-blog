<?php
// Warning: This is PHP template written as RAW.
?>
<?php // Do not delete these lines
	if ( ! defined('HABARI_PATH' ) ) { die( _t('Please do not load this page directly.') ); }
?>
<div id="sidebar" class="col2 line2">
	<?php Plugins::act( 'theme_sidebar_top' ); ?>
	<?php if ($controller_action == 'display_home'): ?>
        <?php $theme->colophon(); ?>
        <div class="vcol" id="deliciousfeed">
            <h3>find me in...</h3>
            <a rel="external" href="http://www.linkedin.com/in/anupom">Linkedin</a>
            <a rel="external" href="http://github.com/anupom">Github</a>
            <a rel="external" href="http://twitter.com/anupom">Twitter</a>
            <a rel="external" href="http://delicious.com/anupom">Delicious</a>
            <a rel="external" href="http://www.slideshare.net/anupom98">Slideshare</a>
            <a rel="external" href="http://www.google.com.bd/search?q=anupom+syam">Google</a>
        </div>
        <?php $theme->flickrfeed(); ?>
    <?php endif ;?>
    <?php $theme->show_tags(); ?>
	<?php if ($show_previously): ?><?php include 'previously.php'; ?><?php endif; ?>
	<?php if ($show_latest): ?><?php include 'latestposts.php'; ?><?php endif; ?>
	<?php if ($controller_action == 'display_home'): ?>
	<?php $theme->show_recentcomments(); ?>
	<?php endif ;?>
	<?php if ($controller_action == 'display_home'): ?>
    <?php $theme->deliciousfeed(); ?>
    <?php endif ;?>
	<?php Plugins::act( 'theme_sidebar_bottom' ); ?>
</div>