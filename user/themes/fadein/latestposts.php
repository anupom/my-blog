<?php
// Warning: This is PHP template written as RAW.
?>
<?php // Do not delete these lines
	if ( ! defined('HABARI_PATH' ) ) { die( _t('Please do not load this page directly.') ); }
?>
<div id="latest" class="entry-list vcol">
	<?php if ( sizeof( (array) $latest ) ): ?>
	<h3><?php _e('Latest posts'); ?></h3>
	<ul>
		<?php foreach ($latest as $apost): ?>
		<li class="clearfix">
			<div class="entry-list-meta">
				<h4><a href="<?php echo $apost->permalink; ?>" title="<?php echo $apost->title; ?>"><?php echo $apost->title_out; ?></a></h4>
				<h5><?php echo $apost->pubdate_excerpt; ?></h5>
			</div>
			<div class="entry-list-comments">
				<a href="<?php echo $apost->permalink; ?>#comments" class="entry-commentcount" title="<?php _e("Comment on $apost->title"); ?>"><?php echo $apost->comments->approved->count ?></a>
			</div>
			<div class="clear"></div>
		</li>
		<?php endforeach; ?>
	</ul>
	<?php endif; ?>
</div>