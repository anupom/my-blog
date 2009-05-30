<?php
/* vim: set expandtab tabstop=1 shiftwidth=1 softtabstop=1 foldmethod=marker */
// Warning: This is PHP template written as RAW.
?>
<?php // Do not delete these lines
	if ( ! defined('HABARI_PATH' ) ) { die( _t('Please do not load this page directly.') ); }
?>
<?php foreach ( $posts as $post ) : ?>
<div class="entry">
	<div class="entry-meta clearfix">
		<div class="entry-meta-main">
			<?php if ( is_array( $post->tags ) && sizeof( (array) $post->tags ) ) : ?>
			<div class="entry-tags">
				<?php echo $post->tags_out; ?>
			</div>
			<?php endif; ?>
            <h2 class="entry-title"><a href="<?php echo $post->permalink; ?>" title="<?php echo $post->title; ?>"><?php echo $post->title_out; ?></a></h2>
            <span class="post-date"><?php echo $post->pubdate->out("M d, Y") ?>&nbsp;<?php echo $post->pubdate_time; ?></span>
            <?php if ( $user instanceof User ): ?>| <a href="<?php URL::out( 'admin', 'page=publish&id=' . $post->id); ?>" title="<?php _e("Edit $post->title"); ?>"><?php _e('edit this post'); ?></a><?php endif ?>
		</div>
        <div class="entry-meta-comment">
			<?php if ( !$post->info->comments_disabled ) : ?><a href="<?php echo $post->permalink; ?>#comment-form" class="entry-addcomment" title="<?php _e("Add comment to $post->title"); ?>">Add comment</a><?php endif; ?>
			<a href="<?php echo $post->permalink; ?>#comments" class="entry-commentcount" title="<?php _e("Comment on $post->title"); ?>"><?php echo $post->comments->approved->count ?></a>
		</div>
		<div class="clear"></div>
	</div>
	<div class="entry-content">
		<?php echo $post->content_excerpt; ?>
	</div>
</div>
<?php endforeach; ?>
<div id="page-selector">
	<?php $theme->prev_page_link( _t('&laquo; Newer') ); ?> <?php $theme->page_selector( null, array( 'leftSide' => 2, 'rightSide' => 2 ) ); ?> <?php $theme->next_page_link( _t( 'Older &raquo;' ) ); ?>
</div>