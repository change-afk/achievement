var pages = 0,groups=0;
layui.use(['jquery','layer','element','laypage'],function(){
	      window.jQuery = window.$ = layui.jquery;
	      window.layer = layui.layer;
          var element = layui.element(),
              laypage = layui.laypage;

          $(document).ready(function() {
        		var url = "../../teacher/selectTeacher";
        		$.ajax({
        			url:url,
        			type:"post", 
        			dataType:"json",
        			async:false, 
        		    data:{}, 
        		    success:function(data){
    		    	  pages = data.page.totalPage; 
    		    	  $('#teacherTable tr:gt(0)').remove();//删除之前的数据
                      var str = '';var j=1;
                      for(var i=0;i<data.list.length;i++){
                      	str+= '<tr><td><input type="checkbox" id="sel" value="'+data.list[i].tid+'"></td><td>'+j+'</td><td>'+data.list[i].tid+
                      	'</td><td>'+data.list[i].tname+'</td><td>'+data.list[i].telephone+'</td><td>'+data.list[i].tprofession+'</td><td>'+data.list[i].tunit+
                      	'</td><td>'+data.list[i].tintime+'</td><td>'+data.list[i].tdegree+'</td><td>'+data.list[i].tmajor+
                      	'</td><td>'+data.list[i].tmail+'</td><td>'+data.list[i].tplace+'</td><td>'+
                      	'<a class="layui-btn layui-btn-mini news_edit" onclick="uptTeacher(this)"><i class="iconfont icon-edit"></i> 修改信息</a>&nbsp;&nbsp;'+
                      	'<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delTeacher(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;';
                      	j++;
                      }
                      $('#teacherTable').append(str);
        		    },
        		    error:function(){ 
        		    	top.layer.msg("后端查询接口异常！");
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
			var url = "../../teacher/selectTeacher";
		}else{
			var url = "../../teacher/selTeacher";
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
                    	str+= '<tr><td><input type="checkbox" id="sel" value="'+data.list[i].tid+'"></td><td>'+j+'</td><td>'+data.list[i].tid+
                      	'</td><td>'+data.list[i].tname+'</td><td>'+data.list[i].telephone+'</td><td>'+data.list[i].tprofession+'</td><td>'+data.list[i].tunit+
                      	'</td><td>'+data.list[i].tintime+'</td><td>'+data.list[i].tdegree+'</td><td>'+data.list[i].tmajor+
                      	'</td><td>'+data.list[i].tmail+'</td><td>'+data.list[i].tplace+'</td><td>'+
                      	'<a class="layui-btn layui-btn-mini news_edit" onclick="uptTeacher(this)"><i class="iconfont icon-edit"></i> 修改信息</a>&nbsp;&nbsp;'+
                      	'<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delTeacher(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;';
                      	j++;
                    }
                    $('#teacherTable').append(str);
                    pageFind();//调用分页方法
				}
			},
			error:function(){
				layer.msg('查询接口异常', {icon: 2});
			}
		});
	})
	
	$(".teacher_del").click(function(){//批量删除
		var ids = new Array();
        $("input:checkbox[id='sel']:checked").each(function(i){
           ids[i] = $(this).val();
         });
		if(ids==""){
			layer.msg("请选择");
		}else{
			var url = "../../teacher/delTeacher";
			layer.confirm("确定删除选中信息？",{btn: ['确定', '取消'],title:"提示"}, function(){
				$.ajax({
				       url:url,
				       type:"post", 
					   dataType:"json",
					   contentType : "application/json" ,
					   async:false,
				       data:JSON.stringify(ids), 
				       success:function(data){		
					    	if(data.flag!=-1){
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
		$(".teacherAdd_btn").click(function(){//添加账号
			var index = layui.layer.open({
				title : "添加教师信息",
				type : 2,
				content : "../mode/addTeacher.jsp", 
				success : function(layero, index){ 
					setTimeout(function(){
						layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
							tips: 3
						});
					},1000)
				}
			})			
			layui.layer.full(index);
		})
	}).resize();
})
 
function uptTeacher(obj){//修改信息
	var $td = $(obj).parents('tr').children('td');
	var tid = $td.eq(2).text();
	var index = layui.layer.open({
		title : "修改教师信息",
		type : 2,
		content : "../mode/editTeacher.jsp", 
		success : function(layero, index){
			var body = layer.getChildFrame('body', index);
		    var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
		    var url = "../../teacher/selectTeacherByTid";
		    $.ajax({	//查找信息数据回填
				  url:url,
				  type:"post", 
				  dataType:"json",
				  async:false,
				  data:{"tid":tid}, 
				  success:function(data){
					  if(data.flag==1){
						  var base64Img = "data:image/jpg;base64,"+data.teacher.timg;
						  body.find('#tid').val(data.teacher.tid);
						  body.find('#tname').val(data.teacher.tname);
						  body.find('#tsex').val(data.teacher.tsex);
						  body.find('#telephone').val(data.teacher.telephone);
						  body.find('#tprofession').val(data.teacher.tprofession);
						  body.find('#tunit').val(data.teacher.tunit);
						  body.find('#tintime').val(data.teacher.tintime);
						  body.find('#tdegree').val(data.teacher.tdegree);
						  body.find('#tmajor').val(data.teacher.tmajor);
						  body.find('#tschool').val(data.teacher.tschool);
						  body.find('#tmail').val(data.teacher.tmail);
						  body.find('#tplace').val(data.teacher.tplace);
						  body.find('#tgroup').val(data.teacher.tgroup);
						  body.find('#tpersonal').val(data.teacher.tpersonal); 
						  body.find('#timg').text(data.teacher.timg);
						  body.find('#showImg').append('<img src="'+ base64Img +'" class="layui-upload-img" style="width:240px;height:320px">');
					  }else
						  top.layer.msg(data.msg);
					  
				  },
				  error:function(){ 
					  top.layer.msg("后端查询接口异常！");
				  }
			  });  
		    body.find('#tid').val(tid);
		    
			setTimeout(function(){
				layui.layer.tips('点击此处返回账号列表', '.layui-layer-setwin .layui-layer-close', {
					tips: 3
				});
			},1000)
		}
	})			
	layui.layer.full(index);
}

function delTeacher(obj){//删除信息
	var ids = new Array();
	var $td = $(obj).parents('tr').children('td');
	var tid = $td.eq(2).text();
	var name = $td.eq(3).text();
	ids.push(tid);
	var mes = "确定删除"+name+"的信息，将同时删除其他相关信息";
	var url = "../../teacher/delTeacher";
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
			    		layer.msg('信息删除成功', {icon: 1});
			    		location.reload(); 
			    	}else{
			    		layer.msg("信息删除失败",{icon:2});	
			    	}
				} 
		    });
	},function(){
		layer.msg('已取消', {
		    time: 2000, //20s后自动关闭
		  })
	});
}

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
					var url = "../../teacher/selectTeacher";
				}else{
					var url = "../../teacher/selTeacher";
				}
			  if(!first) { 
				  $.ajax({
					  url:url,
					  type:"post", 
					  dataType:"json",
					  async:false,
					  data:{"currPage":curr,"searchMsg":msg}, 
					  success:function(data){
						  $('table tbody').empty();
						  var str = '';var j=1; 
						  for(var i=0;i<data.list.length;i++){
		                      	str+= '<tr><td><input type="checkbox" id="sel" value="'+data.list[i].tid+'"></td><td>'+j+'</td><td>'+data.list[i].tid+
		                      	'</td><td>'+data.list[i].tname+'</td><td>'+data.list[i].telephone+'</td><td>'+data.list[i].tprofession+'</td><td>'+data.list[i].tunit+
		                      	'</td><td>'+data.list[i].tintime+'</td><td>'+data.list[i].tdegree+'</td><td>'+data.list[i].tmajor+
		                      	'</td><td>'+data.list[i].tmail+'</td><td>'+data.list[i].tplace+'</td><td>'+
		                      	'<a class="layui-btn layui-btn-mini news_edit" onclick="uptTeacher(this)"><i class="iconfont icon-edit"></i> 修改信息</a>&nbsp;&nbsp;'+
		                      	'<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delTeacher(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;';
		                      	j++;
		                   }
						  $('#teacherTable').append(str);
					  },
					  error:function(){ 
						  top.layer.msg("后端查询接口异常！");
					  }
				  });  
			  }
		  }
	  });
	 });
}