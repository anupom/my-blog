<?php
// Warning: This is PHP template written as RAW.
?>
<?php // Do not delete these lines
	if ( ! defined('HABARI_PATH' ) ) { die( _t('Please do not load this page directly.') ); }
?>
<?php include 'header.php'; ?>
<div id="content" class="clearfix">
	<div id="main-content" class="col1 line1">
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
				<?php echo $post->content_out; ?>
			</div>
		</div>
	</div>
	<?php include 'sidebar.php'; ?>
	<?php include 'verybar.php'; ?>
</div>
<div id="comments-wrapper" class="clearfix">
	<div class="clearfix"><div class="col1 line1a"></div><div class="col2 line2a"></div><div class="col3 line3a"></div></div>
	<?php include 'comments.php'; ?>
	<?php include 'commentform.php'; ?>
	<div class="clear"></div>
</div>
<?php include 'footer.php'; ?>