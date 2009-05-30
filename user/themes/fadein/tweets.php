<?php
// Warning: This is PHP template written as RAW.
?>
<?php // Do not delete these lines
	if ( ! defined('HABARI_PATH' ) ) { die( _t('Please do not load this page directly. Thanks!') ); }
?>
<?php
    if(!empty($tweets[0])):
        $tweet = $tweets[0];
?>
<div id="twitter">
	<div id="twitter-header">
    <a href="http://twitter.com/<?php echo urlencode( Options::get( 'twitter__username' )); ?>" title="Follow me at twitter">twitter</a></div>
	<div id="twitter-bubble">
		<a href="http://twitter.com/<?php echo urlencode( Options::get( 'twitter__username' )); ?>" title="Follow me at twitter">
            <img id="twitter-picture" src="<?php echo htmlspecialchars( $tweet->image_url ); ?>" width="48" height="48" alt="<?php echo urlencode( Options::get( 'twitter__username' )); ?>">
        </a>
		<div id="twitter-status">
			<?php echo $tweet->text; ?>
		</div>
	</div>
</div>
<?php endif; ?>