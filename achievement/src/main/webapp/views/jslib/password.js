var pages = 0,groups=0;
layui.use(['jquery','layer','element','laypage'],function(){
	      window.jQuery = window.$ = layui.jquery;
	      window.layer = layui.layer;
          var element = layui.element(),laypage = layui.laypage;
          
          $(document).ready(function() {
      		var url = "../../password/selectPass";
      		$.ajax({
      			url:url,
      			type:"post", 
      			dataType:"json",
      			async:false, 
      		    data:{}, 
      		    success:function(data){
      		    	pages = data.page.totalPage; 
      		    	$('#passTable tr:gt(0)').remove();//删除之前的数据
                    var str = '';var j=1;
                    //layer.alert(data.list.length);  
                    for(var i=0;i<data.list.length;i++){
                    	str+= '<tr><td><input type="checkbox" id="sel" value="'+data.list[i].pid+'"></td><td style="display:none">'+data.list[i].pid+
                    	'</td><td>'+j+'</td><td>'+data.list[i].tname+
                    	'</td><td>'+data.list[i].tid+'</td><td>'+data.list[i].tpower+'</td><td>'+
                    	'<a class="layui-btn layui-btn-mini news_edit" onclick="setPass(this)"><i class="iconfont icon-edit"></i> 重置密码</a>&nbsp;&nbsp;'+
                    	'<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delPass(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;'+
                    	'<a class="layui-btn layui-btn-normal layui-btn-mini news_collect"  onclick="power(this)"><i class="layui-icon"></i> 更改权限</a>'+'</td></tr>';
                    	j++;
                    }
                    $('#passTable').append(str);
      		    },
      		    error:function(){ 
      		    	top.layer.msg("数据查询失败！");
      		    }
      		 });  
      	});
         pageFind();//调用分页方法
    });

layui.use(['form','layer','jquery','laypage'],function(){ 
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		$ = layui.jquery;

	$(".search_btn").click(function(){//查询信息
		var msg = $(".search_input").val().replace(/(^\s*)|(\s*$)/g, "");//去除字符串两边空格
		if(msg==""){
			var url = "../../password/selectPass";
		}else{
			var url = "../../password/search";
		}
		$.ajax({
			url:url,
			type:"post", 
			dataType:"json",
			async:false,
			data:{"searchMsg":msg}, 
			success:function(data){
				$("#page").show();
				if(data.flag==-1){
					$('table tbody').empty();
					layer.msg('未查询到记录');
					$("#page").hide();
				}else{
					pages = data.page.totalPage; 
					$('table tbody').empty();
                    var str = '';var j=1; 
                    for(var i=0;i<data.list.length;i++){
                    	str+= '<tr><td><input type="checkbox" id="sel" value="'+data.list[i].pid+'"></td><td style="display:none">'+data.list[i].pid+
                    	'</td><td>'+j+'</td><td>'+data.list[i].tname+
                    	'</td><td>'+data.list[i].tid+'</td><td>'+data.list[i].tpower+'</td><td>'+
                    	'<a class="layui-btn layui-btn-mini news_edit" onclick="setPass(this)"><i class="iconfont icon-edit"></i> 重置密码</a>&nbsp;&nbsp;'+
                    	'<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delPass(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;'+
                    	'<a class="layui-btn layui-btn-normal layui-btn-mini news_collect"  onclick="power(this)"><i class="layui-icon"></i> 更改权限</a>'+'</td></tr>';
                    	j++; 
                    }
                    $('#passTable').append(str);
                    pageFind();//调用分页方法
				}
			},
			error:function(){
				layer.msg('查询接口异常', {icon: 2});
			}
		});
	})
	
	$(".reset_btn").click(function(){//重置全部密码
		var url = "../../password/resetAllPass";
		layer.confirm("是否要重置所有密码？",{btn: ['确定', '取消'],title:"提示"}, function(){
			$.ajax({
				url:url,
				type:"post", 
				dataType:"json",
				contentType : "application/json" ,
				async:false,
				data:{}, 
				success:function(data){		
					if(data.flag!=0){ 
						layer.msg('重置密码成功', {icon: 1});
						location.reload(); 
					}else{
						layer.msg("重置密码失败",{icon:2});	
					}
				} 
			});
		},function(){
			layer.msg('已取消', {
				time: 2000, //20s后自动关闭
			})
		});
	})

	$(".batchDel").click(function(){//批量删除
		var ids = new Array();
        $("input:checkbox[id='sel']:checked").each(function(i){
           ids[i] = $(this).val();
         });
		if(ids==""){
			layer.msg("请选择账号");
		}else{
			var url = "../../password/delPass";
			layer.confirm("确定删除选中账号？",{btn: ['确定', '取消'],title:"提示"}, function(){
				$.ajax({
				       url:url,
				       type:"post", 
					   dataType:"json",
					   contentType : "application/json" ,
					   async:false,
				       data:JSON.stringify(ids), 
				       success:function(data){		
					    	if(data.flag==1){
					    		layer.msg('批量删除成功', {icon: 1});
					    		location.reload(); 
					    	}else{
					    		layer.msg("批量删除失败",{icon:2});	
					    	}
						} 
				    });
			},function(){
				layer.msg('已取消', {
				    time: 2000, //20s后自动关闭
				  })
			});
		}
	})

	$(window).one("resize",function(){
		$(".passAdd_btn").click(function(){//添加账号
			var index = layui.layer.open({
				title : "添加账号",
				type : 2,
				content : "../mode/addPassword.jsp",
				success : function(layero, index){
					setTimeout(function(){
						layui.layer.tips('点击此处返回账号列表', '.layui-layer-setwin .layui-layer-close', {
							tips: 3
						});
					},1000)
				}
			})			
			layui.layer.full(index);
		})
	}).resize();
})

function delPass(obj){//删除账号
	var ids = new Array();
	var $td = $(obj).parents('tr').children('td');
	var name = $td.eq(3).text();
	var id = $td.eq(1).text();
	ids.push(id);
	var mes = "是否删除"+name+"的账号？";
	var url = "../../password/delPass";
	layer.confirm(mes,{btn: ['确定', '取消'],title:"提示"}, function(){
		$.ajax({
		       url:url,
		       type:"post", 
			   dataType:"json",
			   contentType : "application/json" ,
			   async:false,
			   data:JSON.stringify(ids), 
		       success:function(data){		
			    	if(data.flag==1){
			    		layer.msg('账号删除成功', {icon: 1});
			    		location.reload(); 
			    	}else{
			    		layer.msg("账号删除失败",{icon:2});	
			    	}
				} 
		    });
	},function(){
		layer.msg('已取消', {
		    time: 2000, //20s后自动关闭
		  })
	});
}

function setPass(obj){ //重置密码
	var $td = $(obj).parents('tr').children('td');
	var id = $td.eq(1).text();
	var url = "../../password/resetPass";
	layer.confirm("是否重置密码",{btn: ['确定', '取消'],title:"提示"}, function(){
		$.ajax({ 
			url:url,
			type:"post", 
			dataType:"json",
			async:false,
		    data:{"pid":id}, 
		    success:function(data){
		    	if(data.flag==1){
		    		top.layer.msg("密码重置成功", {icon: 1});
		    		location.reload();
		    	}else{
		    		top.layer.msg("密码重置失败",{icon:2});
		    	}
		    },
		    error:function(){ 
		    	top.layer.msg("访问后端失败！");
		    }
		 });  
	},function(){
		layer.msg('已取消', {
		    time: 2000, //20s后自动关闭
		  })
	});
}

function power(obj){ //更改权限
	var msg;
	var $td = $(obj).parents('tr').children('td');
	var id = $td.eq(1).text();
	var power = $td.eq(5).text();
	if(power=="teacher"){
		msg="确定赋予管理员权限";
		powerNew = "admin";
	}else{
		msg="确定取消管理员权限";
		powerNew = "teacher";
	}
	var url = "../../password/changePower";
	layer.confirm(msg,{btn: ['确定', '取消'],title:"提示"}, function(){
		$.ajax({ 
			url:url,
			type:"post", 
			dataType:"json",
			async:false,
			data:{"pid":id,"tpower":powerNew}, 
			success:function(data){
				if(data.flag==1){
					top.layer.msg("权限更改成功", {icon: 1});
					location.reload();
				}else{
					top.layer.msg("权限更改失败",{icon:2});
				}
			},
			error:function(){ 
				top.layer.msg("访问后端失败！");
			}
		});
	},function(){
		layer.msg('已取消', {
		    time: 2000, //20s后自动关闭
		  })
	});
}

//分页方法
function pageFind(){
	layui.use(['jquery','layer','element','laypage'],function(){
	      window.jQuery = window.$ = layui.jquery;
	      window.layer = layui.layer;
        var element = layui.element(),laypage = layui.laypage;
        
	  laypage({
		  cont: 'page',
		  pages: pages ,//总页数
		  groups: 3 ,//连续显示分页数
		  jump: function(obj, first) {
			  //得到了当前页，用于向服务端请求对应数据
			  var curr = obj.curr;
			  var msg = $(".search_input").val().replace(/(^\s*)|(\s*$)/g, "");//去除字符串两边空格
			  if(msg==""){
				  var url = "../../password/selectPass";
			  }else{
				  var url = "../../password/search";
			  }
			  //$('#passTable tr:gt(0)').remove();//删除之前的数据
			  if(!first) { 
				  $.ajax({
					  url:url,
					  type:"post", 
					  dataType:"json",
					  async:false,
					  data:{"currPage":curr,"searchMsg":msg}, 
					  success:function(data){
						  //pages = data.page.totalPage; 
						  $('table tbody').empty();
						  //$('#passTable').remove();//删除之前的数据
						  var str = '';var j=1; 
						  //layer.alert(data.list.length);  
						  for(var i=0;i<data.list.length;i++){
							  str+= '<tr><td><input type="checkbox" id="sel" value="'+data.list[i].pid+'"></td><td style="display:none">'+data.list[i].pid+
							  '</td><td>'+j+'</td><td>'+data.list[i].tname+
							  '</td><td>'+data.list[i].tid+'</td><td>'+data.list[i].tpower+'</td><td>'+
							  '<a class="layui-btn layui-btn-mini news_edit" onclick="setPass(this)"><i class="iconfont icon-edit"></i> 重置密码</a>&nbsp;&nbsp;'+
							  '<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delPass(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;'+
							  '<a class="layui-btn layui-btn-normal layui-btn-mini news_collect"  onclick="power(this)"><i class="layui-icon"></i> 更改权限</a>'+'</td></tr>';
							  j++; 
						  }
						  $('#passTable').append(str);
					  },
					  error:function(){ 
						  top.layer.msg("数据查询失败！");
					  }
				  });  
			  }
		  }
	  });
	});
}
