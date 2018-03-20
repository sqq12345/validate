<?php if (!defined('THINK_PATH')) exit();?>

<br>
<form id="ff" method="post">
    <div>
        <label>名称:</label>
        <input class="easyui-textbox" type="text" name="title" value='<?php echo ($row["title"]); ?>' data-options="required:true,width:220,height:28" />
    </div>
    <div>
        <label >操作:</label>
        <input type='checkbox' id='checkall'>全选
     </div>
       <ul class='actions'>
		<?php if(is_array($actions)): foreach($actions as $key=>$v): if(in_array(($v["id"]), is_array($row["level"])?$row["level"]:explode(',',$row["level"]))): ?><li><input type='checkbox' name='level[]' value='<?php echo ($v["id"]); ?>' checked='checked'><?php echo ($v["title"]); ?></li>
			<?php else: ?>
				<li><input type='checkbox' name='level[]' value='<?php echo ($v["id"]); ?>'><?php echo ($v["title"]); ?></li><?php endif; endforeach; endif; ?>
	</ul>
		
   
    
    <div style='clear:both;'></div>
    <br>
    <div>
        <label> </label>
        <a id='submit' class="easyui-linkbutton" data-options="iconCls:'icon-ok'" >提交</a>
    </div>
</form>

<script>
	$('#checkall').click(function(){
		var status=$(this).prop('checked');
		$('.actions li input').prop('checked',status);
	});
	
	$('.actions li input').click(function(){
		var total=$('.actions li input').length;
		var checks=$('.actions li input:checked').length;
		//alert(total);
		if(total==checks){
			$('#checkall').prop('checked',true);
			
		}else{
			$('#checkall').prop('checked',false);
		}
		
		 
		
	});

</script>

<script>
//添加修改表单提交
var type='<?php echo ((isset($type) && ($type !== ""))?($type):"add"); ?>';
$('#submit').linkbutton({
	onClick:function(){
		$('#ff').form('submit', {    
		    url:'/index.php/Admin/Group/edit/id/1?_=1521518040873',    
		    onSubmit: function(param){    
		          var isvalidate=$(this).form('validate');
		          return isvalidate;
		    },    
		    success:function(data){		    	 
		   		var data=eval('('+data + ')');
		   		if(data.code<10){
		   			if(type=='add'){
		   				$('#win').window('refresh');
		   			}else{
		   				$('#win').window('close');
		   			}
		   			
		   		}else{
		   			layer.msg(data.msg);  
		   		}
		        
		   		 
		    }    
		});  

		
	}
});
</script>