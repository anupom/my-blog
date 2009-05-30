<?php
// Warning: This is PHP template written as RAW.
?>
<?php // Do not delete these lines
	if ( ! defined('HABARI_PATH' ) ) { die( _t('Please do not load this page directly.') ); }
?>
<?php include 'header.php'; ?>
<div id="content" class="clearfix">
	<div id="main-content" class="col1 line1 entry-multiple">
	<?php include 'multipleposts.php'; ?>
	</div>
	<?php include 'sidebar.php'; ?>
	<?php include 'verybar.php'; ?>
</div>
<?php include 'footer.php'; ?>