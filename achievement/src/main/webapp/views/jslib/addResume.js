layui.use(['form','layer','jquery','laydate'],function(){
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		laydate = layui.laydate,
		$ = layui.jquery;
 
	$(".edu_add_btn").click(function(){//添加教育经历
		var index = layui.layer.open({
			title : "添加教育经历",
			type : 2, 
			area:["800px","425px"],
			content : "../mode/addEducation.jsp", 
			success : function(layero, index){ 
				setTimeout(function(){
					layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
						tips: 3
					});
				},1000)
			}
		})			
	});
	
	$(".work_add_btn").click(function(){//添加工作经历
		var index = layui.layer.open({
			title : "添加工作经历",
			type : 2, 
			area:["800px","425px"],
			content : "../mode/addWork.jsp", 
			success : function(layero, index){ 
				setTimeout(function(){
					layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
						tips: 3
					});
				},1000)
			}
		})			
	});

	$(".social_add_btn").click(function(){//添加社会兼职
		var index = layui.layer.open({
			title : "添加社会兼职",
			type : 2, 
			area:["800px","375px"],
			content : "../mode/addSocial.jsp", 
			success : function(layero, index){ 
				setTimeout(function(){
					layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
						tips: 3
					});
				},1000)
			}
		})			
	});

	$(".research_add_btn").click(function(){//添加研究方向
		var index = layui.layer.open({
			title : "添加研究方向",
			type : 2, 
			area:["800px","375px"],
			content : "../mode/addResearch.jsp", 
			success : function(layero, index){ 
				setTimeout(function(){
					layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
						tips: 3
					});
				},1000)
			}
		})			
	});
	
	$(document).ready(function() {//页面加载方法
		setTimeout(function(){
			var tid = $('.tid').text(); 
			$.ajax({//查询教育经历
				url:"../../education/selectEducation",
				type:"post", 
				dataType:"json", 
				async:false,
				data:{"tid":tid}, 
				success:function(data){		
					if(data.flag==-1){
						layer.msg('教育经历查询失败', {icon: 2});
					}else{
						var str = ''; 
						for(var i=0;i<data.list.length;i++){
							str+= '<tr><td></td><td style="display:none">'+data.list[i].eid+'</td><td style="text-align:left">'+data.list[i].etime+'</td><td style="text-align:left">'+data.list[i].edesc+'</td><td>'+
							'<a class="layui-btn layui-btn-mini news_edit" onclick="delEdu(this)"><i class="iconfont icon-edit"></i> 删除</a>&nbsp;&nbsp;';
						}
						$('#educationTable').append(str);
					}
				}
			});
			$.ajax({//查询工作经历
				url:"../../work/selectWork",
				type:"post", 
				dataType:"json",  
				async:false,
				data:{"tid":tid}, 
				success:function(data){		
					if(data.flag==-1){
						layer.msg('工作经历查询失败', {icon: 2});
					}else{
						var str = ''; 
						for(var i=0;i<data.list.length;i++){
							str+= '<tr><td></td><td style="display:none">'+data.list[i].wid+'</td><td style="text-align:left">'+data.list[i].wtime+'</td><td style="text-align:left">'+data.list[i].wdesc+'</td><td>'+
							'<a class="layui-btn layui-btn-mini news_edit" onclick="delWork(this)"><i class="iconfont icon-edit"></i> 删除</a>&nbsp;&nbsp;';
						}
						$('#workTable').append(str);
					}
				}
			});
			$.ajax({//查询社会兼职
				url:"../../social/selectSocial",
				type:"post", 
				dataType:"json",  
				async:false,
				data:{"tid":tid}, 
				success:function(data){		
					if(data.flag==-1){
						layer.msg('社会兼职查询失败', {icon: 2});
					}else{
						var str = ''; 
						for(var i=0;i<data.list.length;i++){
							str+= '<tr><td></td><td style="display:none">'+data.list[i].sid+'</td><td style="text-align:left">'+data.list[i].sdesc+'</td><td>'+
							'<a class="layui-btn layui-btn-mini news_edit" onclick="delSoc(this)"><i class="iconfont icon-edit"></i> 删除</a>&nbsp;&nbsp;';
						}
						$('#socialTable').append(str);
					}
				}
			});
			$.ajax({//查询研究方向
				url:"../../research/selectResearch",
				type:"post", 
				dataType:"json",  
				async:false,
				data:{"tid":tid}, 
				success:function(data){		
					if(data.flag==-1){
						layer.msg('研究方向查询失败', {icon: 2});
					}else{
						var str = ''; 
						for(var i=0;i<data.list.length;i++){
							str+= '<tr><td></td><td style="display:none">'+data.list[i].rid+'</td><td style="text-align:left">'+data.list[i].rdesc+'</td><td>'+
							'<a class="layui-btn layui-btn-mini news_edit" onclick="delRes(this)"><i class="iconfont icon-edit"></i> 删除</a>&nbsp;&nbsp;';
						}
						$('#researchTable').append(str);
					}
				}
			});
			
		},100)
		});
})

//删除教育经历
function delEdu(obj){
	$ = layui.jquery;
	var $td = $(obj).parents('tr').children('td');
	var eid = $td.eq(1).text();
	layer.confirm("确定删除该条数据？",{btn: ['确定', '取消'],title:"提示"}, function(){
		$.ajax({
			url:"../../education/delEducation",
			type:"post", 
			dataType:"json",  
			async:false,
			data:{"eid":eid}, 
			success:function(data){		
				if(data.flag==-1){
					layer.msg("删除失败",{icon:2});	
				}else{
					layer.msg('删除成功', {icon: 1});
				}
				location.reload(); 
			}
		});
	},function(){
		layer.msg('已取消', {
		    time: 2000, //20s后自动关闭
		  })
	});
}
//删除工作经历
function delWork(obj){
	$ = layui.jquery;
	var $td = $(obj).parents('tr').children('td');
	var wid = $td.eq(1).text();
	layer.confirm("确定删除该条数据？",{btn: ['确定', '取消'],title:"提示"}, function(){
		$.ajax({
			url:"../../work/delWork",
			type:"post", 
			dataType:"json",  
			async:false,
			data:{"wid":wid}, 
			success:function(data){		
				if(data.flag==-1){
					layer.msg("删除失败",{icon:2});	
				}else{
					layer.msg('删除成功', {icon: 1});
				}
				location.reload(); 
			}
		});
	},function(){
		layer.msg('已取消', {
		    time: 2000, //20s后自动关闭
		  })
	});
}
//删除社会兼职
function delSoc(obj){
	$ = layui.jquery;
	var $td = $(obj).parents('tr').children('td');
	var sid = $td.eq(1).text();
	layer.confirm("确定删除该条数据？",{btn: ['确定', '取消'],title:"提示"}, function(){
		$.ajax({
			url:"../../social/delSocial",
			type:"post", 
			dataType:"json",  
			async:false,
			data:{"sid":sid}, 
			success:function(data){		
				if(data.flag==-1){
					layer.msg("删除失败",{icon:2});	
				}else{
					layer.msg('删除成功', {icon: 1});
				}
				location.reload(); 
			}
		});
	},function(){
		layer.msg('已取消', {
		    time: 2000, //20s后自动关闭
		  })
	});
} 
//删除研究方向
function delRes(obj){
	$ = layui.jquery;
	var $td = $(obj).parents('tr').children('td');
	var rid = $td.eq(1).text();
	layer.confirm("确定删除该条数据？",{btn: ['确定', '取消'],title:"提示"}, function(){
		$.ajax({
			url:"../../research/delResearch",
			type:"post", 
			dataType:"json",  
			async:false,
			data:{"rid":rid}, 
			success:function(data){		
				if(data.flag==-1){
					layer.msg("删除失败",{icon:2});	
				}else{
					layer.msg('删除成功', {icon: 1});
				}
				location.reload(); 
			}
		});
	},function(){ 
		layer.msg('已取消', {
		    time: 2000, //20s后自动关闭
		  })
	});
}
