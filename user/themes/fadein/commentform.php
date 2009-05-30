<?php
// Warning: This is PHP template written as RAW.
?>
<?php // Do not delete these lines
	if ( ! defined('HABARI_PATH' ) ) { die( _t('Please do not load this page directly.') ); }
?>
<div class="col2a">
	<div id="comment-form-col">
		<h3><?php _e('Leave a comment'); ?></h3>
		<?php if ( !$post->info->comments_disabled ) : ?>
		<form id="comment-form" action="<?php URL::out( 'submit_feedback', array( 'id' => $post->id ) ); ?>" method="post">
			<div id="comment-form-box">
				<span class="commentform-cornertop">&nbsp;</span>
				<div>
					<?php if ( Session::has_messages() ): ?>
					<div id="comment-form-messages">
					<?php Session::messages_out(); ?>
					</div>
					<?php endif; ?>
					<p style="margin-top:0;"><label for="name"><?php _e('Name'); ?> <span><?php _e('(required)'); ?></span></label>
					<input type="text" name="name" id="name" size="32" tabindex="1" maxlength="255" value="<?php echo $commenter_name; ?>"></p>
					<p><label for="email"><?php _e('Email'); ?> <span><?php _e('(required)'); ?></span></label>
					<input type="text" name="email" id="email" size="32" tabindex="2" maxlength="255" value="<?php echo $commenter_email; ?>"></p>
					<p><label for="url"><?php _e('Website'); ?></label>
					<input type="text" name="url" id="url" size="32" tabindex="3" maxlength="255" value="<?php echo $commenter_url; ?>"></p>
					<p style="margin-bottom:0;"><textarea name="content" id="comment-content" rows="8" cols="36" tabindex="4"><?php echo $commenter_content; ?></textarea></p>
				</div>
				<span class="commentform-cornerbottom">&nbsp;</span>
			</div>
			<div id="comment-form-submit">
				<input type="submit" id="submit" class="button" value="<?php _e('SHOUT IT'); ?>" tabindex="5">
			</div>
		</form>
		<?php else: ?>
		<div id="comment-form-box">
			<span class="commentform-cornertop">&nbsp;</span>
			<div><?php _e('Comments are closed for this post.'); ?></div>
			<span class="commentform-cornerbottom">&nbsp;</span>
		</div>
		<?php endif; ?>
	</div>
</div>