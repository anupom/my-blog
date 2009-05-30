<?php
// Warning: This is PHP template written as RAW.
?>
<?php // Do not delete these lines
	if ( ! defined('HABARI_PATH' ) ) { die( _t('Please do not load this page directly.') ); }
?>
<div id="previously" class="entry-list vcol">
	<?php if ( sizeof( (array) $previously ) ): ?>
	<h3><?php _e('Previously'); ?></h3>
	<ul>
		<?php foreach ($previously as $post): ?>
		<li class="clearfix">
			<div class="entry-list-meta">
				<h4><a href="<?php echo $post->permalink; ?>" title="<?php echo $post->title; ?>"><?php echo $post->title_out; ?></a></h4>
				<h5><?php echo $post->pubdate_excerpt; ?></h5>
			</div>
			<div class="entry-list-comments">
				<a href="<?php echo $post->permalink; ?>#comments" class="entry-commentcount" title="<?php _e("Comment on $post->title"); ?>"><?php echo $post->comments->approved->count ?></a>
			</div>
			<div class="clear"></div>
		</li>
		<?php endforeach; ?>
	</ul>
	<?php endif; ?>
</div>