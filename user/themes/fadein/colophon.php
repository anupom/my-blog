<?php
/* vim: set expandtab tabstop=1 shiftwidth=1 softtabstop=1 foldmethod=marker */
// Warning: This is PHP template written as RAW.
?>
<?php // Do not delete these lines
	if ( ! defined('HABARI_PATH' ) ) { die( _t('Please do not load this page directly.') ); }
?>
<?php if (Plugins::is_loaded('Colophon Plugin')): ?>
<div id="colophon" class="vcol">
	<h3><?php echo $theme->colophon_title; ?></h3>
	<?php echo nl2br( $theme->colophon_text ); ?>
</div>
<?php endif; ?>