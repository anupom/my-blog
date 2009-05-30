<?php
// Warning: This is PHP template written as RAW.
?>
<?php // Do not delete these lines
	if ( ! defined('HABARI_PATH' ) ) { die( _t('Please do not load this page directly.') ); }
?>
<div id="tag-list" class="vcol">
	<h3>Tags</h3>
	<?php if (Plugins::is_loaded('RN Tag Cloud')): ?>
	<?php $theme->tag_cloud(); ?>
	<?php else: ?>
	<ul>
	<?php foreach($taglist as $tag): ?>
		<li><a href="<?php echo $tag->url; ?>" title="<?php echo $tag->text; ?>" rel="tag"><?php echo $tag->text; ?></a></li>
	<?php endforeach; ?>
	</ul>
	<?php endif; ?>
</div>