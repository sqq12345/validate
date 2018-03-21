<?php if (!defined('THINK_PATH')) exit();?> 
 
    <form id="ff" method="post" data-options="novalidate:true" >
        <p>
            <label>名称:</label>
            <input class="easyui-textbox" type="text" name="title" data-options="required:true,width:220,height:28" />
        </p>
        <p>
            <label>所属类别:</label>
            <select class="easyui-combobox" name='pid' data-options="width:220,height:28">
                <option value='0'>顶级分类</option>
                <?php if(is_array($titles)): foreach($titles as $key=>$v): ?><option value='<?php echo ($v["id"]); ?>'><?php echo ($v["title"]); ?></option><?php endforeach; endif; ?>
            </select>
        </p>
      
        <p>
            <label >操作:</label>
            <select class="easyui-combobox" name='aid' data-options="width:220,height:28">
                <option value='0'>无</option>
                <?php if(is_array($actions)): foreach($actions as $key=>$v): ?><option value='<?php echo ($v["id"]); ?>'><?php echo ($v["title"]); ?></option><?php endforeach; endif; ?>
            </select>           
        </p>  
        
         <p>
            <label >隐藏:</label>
            <input class="easyui-switchbutton" value='1' name='hidden' data-options="onText:'Yes',offText:'No'">    
        </p>  
        <p>
            <label >排序:</label>
            <input class="easyui-textbox" type="text" name="sort" data-options="width:220,height:28" />       
        </p>
        <p>
            <label >图标:</label>            
            <input id="icons"  class="easyui-combobox" name="icon" data-options="width:220,height:28,valueField:'name',textField:'name',url:'<?php echo U('getIcons');?>'" /> 
            <span id='iconimg' style="margin-left:20px;margin-top:5px;"></span>   
        </p> 
        <p>
            <label >备注:</label>
            <input class="easyui-textbox" type="text" name="remark"  data-options="multiline:true,width:220,height:100" />
        </p>
        <p>
            <label> </label>
            <a id='submit' class="easyui-linkbutton" data-options="iconCls:'icon-ok'" >提交</a>
        </p>
    </form>
    <script>
    	$('#icons').combobox({
    		onChange:function(nvalue,ovalue){    			
    			 geticon(nvalue);
    		}
    	});
    	
    	function geticon(_name){
    		 $.post("<?php echo U('getIconImg');?>",{value:_name},function(msg){
				 $('#iconimg').html("<img src='"+msg+"' style='width:16px;'/>");
			 });
    	}
    	
    	
    </script>
    
    <script>
//添加修改表单提交
var type='<?php echo ((isset($type) && ($type !== ""))?($type):"add"); ?>';
$('#submit').linkbutton({
	onClick:function(){
		$('#ff').form('submit', {    
		    url:'/index.php/Admin/Menu/add.html?_=1521627962417',    
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