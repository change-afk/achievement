var pages = 0,groups=0;
layui.use(['jquery','layer','element','laypage'],function(){
	      window.jQuery = window.$ = layui.jquery;
	      window.layer = layui.layer;
          var element = layui.element(),
              laypage = layui.laypage;

          $(document).ready(function() {
        	 var url = parent.location.search //获取url中"?"符后的字串 ('?modFlag=business&role=1')
     		 var theRequest = new Object()
     		 if (url.indexOf('?') != -1) {
     		 var str = url.substr(1) //substr()方法返回从参数值开始到结束的字符串；
     		 var strs = str.split('&')
     		 for (var i = 0; i < strs.length; i++) {
     		    theRequest[strs[i].split('=')[0]] = strs[i].split('=')[1]
     		 	}
     		 } 
     	    var id=theRequest.id;
     	    var type=theRequest.type;
     	    if(type=="teacher"){
     	    	var url = "../../student/selectStudentT";
     	    }else if(type=="admin"){
     	    	var url = "../../student/selectStudent";
     	    }
        		$.ajax({
        			url:url,
        			type:"post", 
        			dataType:"json",
        			async:false, 
        		    data:{"tid":id}, 
        		    success:function(data){
    		    	  pages = data.page.totalPage; 
    		    	  $('#studentTable tr:gt(0)').remove();//删除之前的数据
                      var str = '';var j=1;
                      for(var i=0;i<data.list.length;i++){
                      	str+= '<tr><td><input type="checkbox" id="sel" value="'+data.list[i].sid+'"></td><td style="display:none">'+data.list[i].sid+'</td><td>'+j+'</td><td>'+data.list[i].sname+
                      	'</td><td>'+data.list[i].sex+'</td><td>'+data.list[i].tname+'</td><td>'+data.list[i].sedu+'</td><td>'+
                      	'<a class="layui-btn layui-btn-mini news_edit" onclick="uptStudent(this)"><i class="iconfont icon-edit"></i> 修改信息</a>&nbsp;&nbsp;'+
                      	'<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delStudent(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;';
                      	j++;
                      }
                      $('#studentTable').append(str);
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
		var url = parent.location.search //获取url中"?"符后的字串 ('?modFlag=business&role=1')
		 var theRequest = new Object()
		 if (url.indexOf('?') != -1) {
		 var str = url.substr(1) //substr()方法返回从参数值开始到结束的字符串；
		 var strs = str.split('&')
		 for (var i = 0; i < strs.length; i++) {
		    theRequest[strs[i].split('=')[0]] = strs[i].split('=')[1]
		 	}
		 } 
	    var id=theRequest.id;
	    var type=theRequest.type;
	    var msg = $(".search_input").val().replace(/(^\s*)|(\s*$)/g, "");//去除字符串两边空格
	    if(type=="teacher"){
	    	if(msg==""){
				var url = "../../student/selectStudentT";
			}else{
				var url = "../../student/selStudentT";
			}
	    }else if(type=="admin"){
	    	if(msg==""){
				var url = "../../student/selectStudent";
			}else{
				var url = "../../student/selStudent";
			}
	    }
		$.ajax({
			url:url,
			type:"post", 
			dataType:"json",
			async:false,
			data:{"searchMsg":msg,"tid":id}, 
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
                      	str+= '<tr><td><input type="checkbox" id="sel" value="'+data.list[i].sid+'"></td><td style="display:none">'+data.list[i].sid+'</td><td>'+j+'</td><td>'+data.list[i].sname+
                      	'</td><td>'+data.list[i].sex+'</td><td>'+data.list[i].tname+'</td><td>'+data.list[i].sedu+'</td><td>'+
                      	'<a class="layui-btn layui-btn-mini news_edit" onclick="uptStudent(this)"><i class="iconfont icon-edit"></i> 修改信息</a>&nbsp;&nbsp;'+
                      	'<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delStudent(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;';
                      	j++;
                      }
                    $('#studentTable').append(str);
                    pageFind();//调用分页方法
				}
			},
			error:function(){
				layer.msg('查询接口异常', {icon: 2});
			}
		});
	})
	
	$(".student_del").click(function(){//批量删除
		var ids = new Array();
        $("input:checkbox[id='sel']:checked").each(function(i){
           ids[i] = $(this).val();
         });
		if(ids==""){
			layer.msg("请选择");
		}else{
			var url = "../../student/delStudent";
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
		$(".studentAdd_btn").click(function(){//添加账号
			var index = layui.layer.open({
				title : "添加学生信息",
				type : 2,
				content : "../mode/addStudent.jsp", 
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
 
function uptStudent(obj){//修改信息
	var $td = $(obj).parents('tr').children('td');
	var sid = $td.eq(1).text();
	var index = layui.layer.open({
		title : "修改学生信息",
		type : 2,
		content : "../mode/editStudent.jsp", 
		success : function(layero, index){
			var body = layer.getChildFrame('body', index);
		    var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
		    var url = "../../student/selectStudentByTid";
		    $.ajax({	//查找信息数据回填
				  url:url,
				  type:"post", 
				  dataType:"json",
				  async:false,
				  data:{"sid":sid}, 
				  success:function(data){
					  if(data.flag==1){
						  var base64Img = "data:image/jpg;base64,"+data.student.simg;
						  body.find('#tid').val(data.student.tid);
						  body.find('#sid').val(data.student.sid);
						  body.find('#sex').val(data.student.sex);
						  body.find('#sname').val(data.student.sname);
						  body.find('#sedu').val(data.student.sedu);
						  body.find('#showImg').append('<img src="'+ base64Img +'" class="layui-upload-img" style="width:240px;height:320px">');
					  }else{
						  top.layer.msg(data.msg);
					  }
					  
				  }, 
				  error:function(){ 
					  top.layer.msg("后端查询接口异常！");
				  }
			  });  
		   // body.find('#tid').val(tid);
		    
			setTimeout(function(){
				layui.layer.tips('点击此处返回账号列表', '.layui-layer-setwin .layui-layer-close', {
					tips: 3
				});
			},1000)
		}
	})			
	layui.layer.full(index);
}

function delStudent(obj){//删除信息
	var ids = new Array();
	var $td = $(obj).parents('tr').children('td');
	var tid = $td.eq(2).text();
	var name = $td.eq(3).text();
	ids.push(tid);
	var mes = "确定删除"+name+"的信息?";
	var url = "../../student/delStudent";
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
			  var url = parent.location.search //获取url中"?"符后的字串 ('?modFlag=business&role=1')
			  
			 var theRequest = new Object()
			 if (url.indexOf('?') != -1) {
			 var str = url.substr(1) //substr()方法返回从参数值开始到结束的字符串；
			 var strs = str.split('&')
			 for (var i = 0; i < strs.length; i++) {
			    theRequest[strs[i].split('=')[0]] = strs[i].split('=')[1]
			 	}
			 } 
		    var id=theRequest.id;
		    var type=theRequest.type;
		    
			  var msg = $(".search_input").val().replace(/(^\s*)|(\s*$)/g, "");//去除字符串两边空格
			  if(type=="teacher"){
			    	if(msg==""){
						var url = "../../student/selectStudentT";
					}else{
						var url = "../../student/selStudentT";
					}
			    }else if(type=="admin"){
			    	if(msg==""){
						var url = "../../student/selectStudent";
					}else{
						var url = "../../student/selStudent";
					}
			    }
			  if(!first) { 
				  $.ajax({
					  url:url,
					  type:"post", 
					  dataType:"json",
					  async:false,
					  data:{"currPage":curr,"searchMsg":msg,"tid":id}, 
					  success:function(data){
						  $('table tbody').empty();
						  var str = '';var j=1; 
						  for(var i=0;i<data.list.length;i++){
		                      	str+= '<tr><td><input type="checkbox" id="sel" value="'+data.list[i].sid+'"></td><td style="display:none">'+data.list[i].sid+'</td><td>'+j+'</td><td>'+data.list[i].sname+
		                      	'</td><td>'+data.list[i].sex+'</td><td>'+data.list[i].tname+'</td><td>'+data.list[i].sedu+'</td><td>'+
		                      	'<a class="layui-btn layui-btn-mini news_edit" onclick="uptStudent(this)"><i class="iconfont icon-edit"></i> 修改信息</a>&nbsp;&nbsp;'+
		                      	'<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delStudent(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;';
		                      	j++;
		                      }
						  $('#studentTable').append(str);
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