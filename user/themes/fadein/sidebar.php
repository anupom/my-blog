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
        <div class="vcol" id="findmein">
            <h3>find me in...</h3>
            <a title="Linked In" rel="external" href="http://www.linkedin.com/in/anupom">
                <img alt="Linked In" src="<?php Site::out_url( 'theme' ); ?>/images/ico/linkedin.gif" />
            </a>
            <a title="Github" rel="external" href="http://github.com/anupom">
                <img alt="Github" src="<?php Site::out_url( 'theme' ); ?>/images/ico/github.gif" />
            </a>
            <a title="Twitter" rel="external" href="http://twitter.com/anupom">
                <img alt="Twitter" src="<?php Site::out_url( 'theme' ); ?>/images/ico/twitter.gif" />
            </a>
            <a title="Delicious" rel="external" href="http://delicious.com/anupom">
                <img alt="Delicious" src="<?php Site::out_url( 'theme' ); ?>/images/ico/delicious.gif" />
            </a>
            <a title="Slideshare" rel="external" href="http://www.slideshare.net/anupom98">
                <img alt="Slideshare" src="<?php Site::out_url( 'theme' ); ?>/images/ico/slideshare.gif" />
            </a>
            <a title="Google" rel="external" href="http://www.google.com.bd/search?q=anupom+syam">
                <img alt="Google" src="<?php Site::out_url( 'theme' ); ?>/images/ico/google.gif" />
            </a>
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