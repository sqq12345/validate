<?php if (!defined('THINK_PATH')) exit();?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <base href="<?php echo (C("BASE")); ?>">
    <link rel="stylesheet" type="text/css" href="ui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="css/icon.css">  
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <script type="text/javascript" src="ui/jquery.min.js"></script>     
    <script type="text/javascript" src="ui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="ui/locale/easyui-lang-zh_CN.js"></script> 
    <script src='layer/layer.js'></script>   
    <title>后台管理</title> 
    
</head>
<body class="easyui-layout">   
    <div class="header" data-options="region:'north',title:'',split:true,border:false" style="height:50px;background-color:#fafafa;">
    	<div class="header-left">
        	<h1>后台管理</h1>
        </div>
        <div class="header-right">
        	<p><strong class="easyui-tooltip" title="未读消息"><?php echo (session('nkname')); ?></strong>，欢迎您！</p>
            <p><a href="#">网站首页</a>|<a href="#">支持论坛</a>|<a href="#">帮助中心</a>|<a href="<?php echo U('logout');?>">安全退出</a></p>
        </div>
    	
    </div>   
    
    <div class="footer" data-options="region:'south',border:true,split:true">
    	&copy; 2018 FZF All Rights Reserved
    </div>
    
    <div data-options="region:'west',title:'菜单',split:true" style="width:180px;height:500px;">
    	<div class="easyui-accordion"  data-options="fit:true" >		     
		   <?php echo W('menu/getmenu');?>
		</div>  
    	
    </div>   
    <div data-options="region:'center'" style="padding:5px;background:#eee;">   	
    	<div id="mytabs" class="easyui-tabs" data-options="border:false,fit:true,tools:'#tab-tools'">   
		    <div title="首页" style="padding:20px;display:none;">   
		          
		    </div> 
		</div>
		<div id="tab-tools">
			<a href="javascript:void(0)" class="easyui-menubutton" data-options="menu:'#mm',iconCls:'icon-text-align-justify'"></a>   
			<div id="mm" style="width:150px;">   
			    <div data-options="iconCls:'icon-refresh'">刷新</div>
			    <div class="menu-sep"></div>   
			    <div>关闭</div>   
			    <div>关闭左边所有</div>   
			    <div>关闭右边所有</div>   
			    <div class="menu-sep"></div>   
			    <div data-options="iconCls:'icon-cancel'">全部关闭</div> 
			</div>  

		</div>  
	</div> 
    
    
</body>
<script>
$('.easyui-accordion li a').click(function(){
	var tabTitle = $(this).text();
	var url = $(this).attr("href");
	var icon =$(this).attr("data-icon");	
	addTab(tabTitle,url,icon);
	$('.easyui-accordion li').removeClass("selected");
	$(this).parent().addClass("selected");
	return false;
});	

function addTab(title,url,icon){
	if ($('#mytabs').tabs('exists', title)){
		$('#mytabs').tabs('select', title);
	} else {
		var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
		$('#mytabs').tabs('add',{
			title:title,
			content:content,
			iconCls:'icon-'+icon,
			closable:true
		});
	}
	
}

$('#mm').menu({
	onClick:function(tm){
		var tab = $('#mytabs').tabs('getSelected');
		var tabIndex=$('#mytabs').tabs('getTabIndex',tab);	
		if(tabIndex>0){		
			switch(tm.text){
				case '刷新':
					var ifr=$('iframe').eq(tabIndex-1);
					ifr.attr('src',ifr.attr('src'));
					break;
				case '关闭':
					$('#mytabs').tabs('close',tabIndex);
					break;
				case '关闭左边所有':
					for(var j=tabIndex-1;j>0;j--){
						$('#mytabs').tabs('close',j);
					}
					$('#mytabs').tabs('select',1);
					break;
				case '关闭右边所有':
					var tabTotal=$('#mytabs').tabs('tabs').length;					 
					for(var j=tabTotal-1;j>tabIndex;j--){
						$('#mytabs').tabs('close',j);
					}
					break;
				case '全部关闭':
					var tabTotal=$('#mytabs').tabs('tabs').length;					
					for(var j=tabTotal-1;j>0;j--){
						$('#mytabs').tabs('close',j);
					}
					break;
			}
		}
	}
});
</script>
</html>