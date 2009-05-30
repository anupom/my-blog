<div class="vcol" id="deliciousfeed">
	<h3>Recent Bookmarks</h3>
    <ul>
    <?php if (is_array($deliciousfeed)): ?>
        <?php foreach ($deliciousfeed as $post): ?>
            <?php if(strpos($post->title, 'http') !== 0): ?>
            <li>
            <a rel="external" href="<?php echo $post->url; ?>">
                <?php echo $post->title; ?>
            </a>
            </li>
            <?php endif; ?>
        <?php endforeach; ?>
    <?php else: ?>
        <li class="delicious-error"><?php echo $deliciousfeed; ?></li>
	<?php endif; ?>
	</ul>
</div>