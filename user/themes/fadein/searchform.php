<?php
/* vim: set expandtab tabstop=1 shiftwidth=1 softtabstop=1 foldmethod=marker */
// Warning: This is PHP template written as RAW.
?>
<?php // Do not delete these lines
	if ( ! defined('HABARI_PATH' ) ) { die( _t('Please do not load this page directly.') ); }
?>
<div id="search" class="col2">
	<form method="get" id="search-form" action="<?php URL::out('display_search'); ?>">
	<div id="search-box"><label for="criteria">Search:</label> <input type="text" name="criteria" id="criteria" value="<?php if ( isset( $criteria ) ) { echo htmlentities($criteria, ENT_COMPAT, 'UTF-8');} ?>"></div>
	<input type="submit" id="search-btn" value="" title="<?php _e( "Go" ); ?>">
	</form>
</div>