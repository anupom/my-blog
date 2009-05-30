<?php
// Warning: This is PHP template written as RAW.
?>
<?php // Do not delete these lines
	if ( ! defined('HABARI_PATH' ) ) { die( _t('Please do not load this page directly.') ); }
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title><?php Options::out( 'title' ) ?><?php if($request->display_entry && isset($post)) { echo " | {$post->title}"; } ?></title>
	<meta http-equiv="Content-Type" content="text/html">
	<meta name="generator" content="Habari <?php echo Version::get_habariversion() ?>">
	<link rel="alternate" type="application/atom+xml" title="Atom 1.0" href="<?php $theme->feed_alternate(); ?>">
	<link rel="edit" type="application/atom+xml" title="Atom Publishing Protocol" href="<?php URL::out( 'atompub_servicedocument' ); ?>">
	<link rel="EditURI" type="application/rsd+xml" title="RSD" href="<?php URL::out( 'rsd' ); ?>">
	<link rel="stylesheet" type="text/css" href="<?php Site::out_url( 'theme' ); ?>/style.css" media="screen">
    <link rel="shortcut icon" href="<?php Site::out_url( 'theme' ); ?>/favicon.ico" type="image/x-icon" />
	<!--[if IE]>
		<link rel="stylesheet" type="text/css" href="<?php Site::out_url( 'theme' ); ?>/ie.css" media="screen">
	<![endif]-->
	<!--[if lt IE 7]>
	<link rel="stylesheet" type="text/css" href="<?php Site::out_url( 'theme' ); ?>/ie6.css" media="screen">
	<script src="<?php Site::out_url('scripts'); ?>/jquery.js" type="text/javascript" charset="utf-8"></script>
	<script src="<?php Site::out_url( 'theme' ); ?>/scripts/jquery.pngfix.js" type="text/javascript" charset="utf-8"></script>
	<script src="<?php Site::out_url( 'theme' ); ?>/scripts/fixpngs.js" type="text/javascript" charset="utf-8"></script>
	<![endif]-->
	<?php $theme->header(); ?>
    <script type="text/javascript" src="http://www.linkedin.com/js/public-profile/widget-os.js"></script>
</head>
<body>
<div id="wrapper">
	<div id="top" class="clearfix">
		<div id="header" class="col1 top-col">
			<h1 id="title"><a href="<?php Site::out_url( 'habari' ) ?>"><?php Options::out( 'title' ); ?></a></h1>
			<p id="tagline"><?php Options::out( 'tagline' ); ?></p>
			<div id="navbar">
				<ul>
					<li><a href="<?php Site::out_url( 'habari' ); ?>">home</a></li>
					<?php foreach ( $pages as $pagelink ) : ?>
					<li><a href="<?php echo $pagelink->permalink; ?>" title="<?php echo $pagelink->title; ?>"><?php echo $pagelink->title; ?></a></li>
					<?php endforeach; ?>
				</ul>
			</div>
		</div>
		<div class="col2a top-col">
			<?php $theme->twitter(); ?>
			<?php include 'searchform.php'; ?>
		</div>
	</div>