<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>添加信息</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="../common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="../common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="../common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="../css/personal.css" media="all">
	<link rel="stylesheet" type="text/css" href="../common/layui/css/modules/laydate/laydate.css" media="all">
</head>
<body class="childrenBody">
		<!-- <div class="layui-form-item">
			<label class="layui-form-label gname">嗷嗷</label>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label tid">嗷嗷</label>
		</div> -->
		<div class="layui-form-item">
			<div class="layui-inline">
		      <label class="layui-form-label">成员姓名</label>
		      <div class="layui-input-inline">
		        <input class="layui-input name" lay-verify="required" placeholder="请输入姓名" type="text">
		      </div>
		      <button class="layui-btn layui-btn-small layui-btn-normal" id="find" style="margin-top:5px">
					<i class="layui-icon">&#xe615;</i><em>查找</em>
				</button>
		    </div>
		</div>
			<table class="layui-table table-hover" lay-even="" lay-skin="nob">
                         <thead>
                             <tr>
                             	 <th></th>
                                 <th>姓名</th>
                                 <th>性别</th>
                                 <th>学历</th>
                             </tr>
                         </thead>
                         <tbody id="memberTable">
                         </tbody>
                    </table>
		<br><br><br><br>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn add_btn" lay-submit="" lay-filter="savePass">添加</button>
		    </div>
		</div>
	<script type="text/javascript" src="../common/layui/layui.all.js"></script>

</body>
<script type="text/javascript">
layui.use(['form','layer','jquery'],function(){ 
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		$ = layui.jquery;
	
	 $(document).ready(function() {
		 $(".add_btn").hide();
	 })
	 
	$("#find").click(function(){//查找
		var msg = $(".name").val();
		var url = "../../group/selectGroupMenber";
		 $.ajax({
			url:url,
			type:"post", 
			dataType:"json",
			async:false,
			data:{"msg":msg}, 
			success:function(data){		
				$('table tbody').empty();
                var str = '';
                var countMap = eval(data.list);
            	for (var i=0;i<countMap.length;i++){ 
                	str+= '<tr><td><input type="checkbox" id="sel" value="'+countMap[i].sid+","+countMap[i].sname+","+countMap[i].sex+","+countMap[i].sedu+'"></td><td>'
                	+countMap[i].sname+'</td><td>'+countMap[i].sex+'</td><td>'+countMap[i].sedu+'</td></tr>'
                }
            	$('#memberTable').append(str);
            	$(".add_btn").show();
			},error:function(){
				alert("出错");
			} 
		}); 
		return false; 
	})
	
	form.on("submit(savePass)",function(obj){
		var ids = new Array();
		var tb = new Array();
	        $("input:checkbox[id='sel']:checked").each(function(i){
	           ids[i] = $(this).val();
	         });
			if(ids==""){
				layer.msg("请选择"); 
			}else if(ids.length>1){ 
				layer.msg("一次只添加一位成员");
			}
		var msg = ids[0];
		tb = msg.split(","); 
		var str='<tr><td id="tsid">'+tb[0]+'</td><td>'+tb[1]+'</td><td>'+tb[2]+'</td><td>'+tb[3]+'</td><td>'+
			'<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delMember(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;</td></tr>';
	    layer.close(layer.index);
	    $(window.parent.document).find("#groupTable").append(str);	
	})
 	
})
</script>
</html>