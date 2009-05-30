<?php
// Warning: This is PHP template written as RAW.
?>
<?php // Do not delete these lines
	if ( ! defined('HABARI_PATH' ) ) { die( _t('Please do not load this page directly.') ); }
?>
<div id="flickr" class="vcol clearfix">
	<h3>Photostream</h3>
	<?php // you may also use flickr Javascript badge here, replace [YOUR FLICKR ID] you can get it at http://idgettr.com/ ?>
	<?php // <script type="text/javascript" src="http://www.flickr.com/badge_code_v2.gne?count=9&amp;display=latest&amp;size=s&amp;layout=x&amp;source=user&amp;user=[YOUR FLICKR ID]"></script> ?>
	<?php if (is_array($flickrfeed)): ?>
	<ul>
		<?php foreach ($flickrfeed as $flickrimage): ?>
		<?php
			// doing cleanup raw image description.
			$description = preg_replace('/\n/', ' ', strip_tags($flickrimage['description_raw']));
			if (strlen($description) > 256) {
				$description = substr($description, 0, 256) . '...';
			}
		?>
		<li><a href="<?php echo $flickrimage['url'] ?>" title="<?php echo _t($description) ?>"><img src="<?php echo $flickrimage['image_url'] ?>" alt="<?php echo htmlspecialchars($flickrimage['title']) ?>" width="75" height="75" /></a></li>
		<?php endforeach; ?>
	</ul>
	<div class="clear"></div>
	<?php else: ?>
		<p><?php echo $flickrfeed ?></p>
	<?php endif; ?>
</div>