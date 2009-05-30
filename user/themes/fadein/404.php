<?php
// Warning: This is PHP template written as RAW.
?>
<?php // Do not delete these lines
	if ( ! defined('HABARI_PATH' ) ) { die( _t('Please do not load this page directly.') ); }
?>
<?php include 'header.php'; ?>
<div id="content" class="clearfix">
	<div id="main-content" class="col1 line1">
		<h2 class="entry-title"><?php _e('Whoops! 404'); ?></h2>
		<p><?php _e( "The page you were trying to access is not really there. Please try again." ); ?></p>
	</div>
	<?php include 'sidebar.php'; ?>
	<?php include 'verybar.php'; ?>
</div>
<?php include 'footer.php'; ?>