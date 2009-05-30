<?php
// Warning: This is PHP template written as RAW.
?>
<?php // Do not delete these lines
	if ( ! defined('HABARI_PATH' ) ) { die( _t('Please do not load this page directly.') ); }
?>
	<div id="footer" class="clearfix">
		<div class="col1 line1a">
			<?php Options::out('title'); ?> is powered by <a href="http://habariproject.org/">Habari <?php _e('0.6-alpha'); ?></a>
		</div>
		<div class="col2 line2a"></div>
		<div class="col3 line3a">
			<ul id="up2top" ><li><a href="#top">Up to top</a></li></ul>
		</div>
	</div>
</div>
<?php $theme->footer(); ?>
</body>
</html>