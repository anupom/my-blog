<?php
// Warning: This is PHP template written as RAW.
?>
<?php // Do not delete these lines
	if ( ! defined('HABARI_PATH' ) ) { die( _t('Please do not load this page directly.') ); }
?>
<div id="recentcomments" class="vcol">
	<h3><?php echo $recentcomments_title; ?></h3>
	<ul>
	<?php foreach ( $recentcomments_links as $link ) : ?>
		<?php echo $link; ?>
	<?php endforeach; ?>
	</ul>
</div>