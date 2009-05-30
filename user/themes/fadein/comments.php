<?php
// Warning: This is PHP template written as RAW.
?>
<?php // Do not delete these lines
	if ( ! defined('HABARI_PATH' ) ) { die( _t('Please do not load this page directly.') ); }
?>
<div id="comments" class="col1">
	<h3><?php _e('Reader Commentary'); ?></h3>
	<h4><b><?php if ( $post->comments->moderated->count > 0 ) { printf( _n('%1$d people', '%1$d peoples', $post->comments->moderated->count), $post->comments->moderated->count ); } else { _e('No one'); } ?></b> <?php _e('have commented so far'); ?>.</h4>
	<?php if ( $post->comments->moderated->count ): ?>
	<?php foreach ( $post->comments->moderated as $comment ): ?>
	<div id="comment-<?php echo $comment->id; ?>" class="comment">
		<div class="comment-meta-main clearfix">
			<div class="comment-meta">
				<p><a href="<?php echo $comment->url_out; ?>" rel="external"><?php echo $comment->name; ?></a></p>
				<span><?php $comment->date->out('l, F jS, Y \a\t g:ia') ?></span>
			</div>
			<?php if (Plugins::is_loaded('Gravatar')): ?>
			<div class="gravatar"><img src="<?php echo $comment->gravatar ?>" width="30" height="30" alt="<?php echo $comment->name; ?>'s Gravatar"></div>
			<?php else: ?>
			<div class="gravatar error">Please load Gravatar plugin.</div>
			<?php endif; ?>
			<div class="clear"></div>
		</div>
		<div class="comment-box">
			<span class="comment-corners-top"><span>&nbsp;</span></span>
			<div class="comment-content">
				<?php echo $comment->content_out; ?>
				<?php if ( $comment->status == Comment::STATUS_UNAPPROVED ) : ?>
				<p class="success"><em><?php _e( 'Your comment is awaiting moderation' ) ;?></em></p>
				<?php endif; ?>
			</div>
			<span class="comment-corners-bottom"><span>&nbsp;</span></span>
		</div>
	</div>
	<?php endforeach; ?>
	<div id="write-comment"><a href="#comment-form" title="Write comment"><?php _e('Submit yours...'); ?></a></div>
	<?php else: ?>
	<p><?php _e('There are currently no comments.'); ?><?php if ( !$post->info->comments_disabled ) : ?> <?php _e('Come on be the first one!'); ?><?php endif; ?></p>
	<?php endif; ?>
</div>