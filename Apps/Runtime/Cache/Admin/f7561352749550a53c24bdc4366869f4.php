<?php if (!defined('THINK_PATH')) exit();?>

<?php if(is_array($data)): foreach($data as $k=>$v): ?><div title="<?php echo ($k); ?>" data-options="iconCls:'icon-<?php echo ($v['icon']); ?>'" style="padding:10px;">
		<ul>
			<?php if(is_array($v)): foreach($v as $key=>$v1): ?><li>
					 <a href='<?php echo ($v1["url"]); ?>' data-icon='<?php echo ($v1["icon"]); ?>'><img src='<?php echo ($v1["img"]); ?>' style='width:16px;'/> <?php echo ($v1["title"]); ?> </a>
				 </li><?php endforeach; endif; ?>
		</ul>
	</div><?php endforeach; endif; ?>