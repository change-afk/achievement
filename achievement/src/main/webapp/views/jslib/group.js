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
      	    	var url = "../../group/selectGroupT";
      	    }else if(type=="admin"){
      	    	var url = "../../group/selectGroup";
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
	                      	str+= '<tr><td>'+j+'</td><td style="display:none">'+data.list[i].tid+'</td><td>'+data.list[i].gname+'</td><td>'+data.list[i].tname+'</td><td>'+data.list[i].sname+'</td><td>'+
	                      	'<a class="layui-btn layui-btn-mini news_edit" onclick="uptGroup(this)"><i class="iconfont icon-edit"></i> 修改信息</a>&nbsp;&nbsp;'+
	                      	'<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delGroup(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;';
	                      	j++;
	                      }
                      $('#groupTable').append(str);
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
				var url = "../../group/selectGroupT";
			}else{
				var url = "../../group/selGroupT";
			}
	    }else if(type=="admin"){
			if(msg==""){
				var url = "../../group/selectGroup";
			}else{
				var url = "../../group/selGroup";
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
                      	str+= '<tr><td>'+j+'</td><td style="display:none">'+data.list[i].tid+'</td><td>'+data.list[i].gname+'</td><td>'+data.list[i].tname+'</td><td>'+data.list[i].sname+'</td><td>'+
                      	'<a class="layui-btn layui-btn-mini news_edit" onclick="uptGroup(this)"><i class="iconfont icon-edit"></i> 修改信息</a>&nbsp;&nbsp;'+
                      	'<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delGroup(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;';
                      	j++;
                      }
                      $('#groupTable').append(str);
                    pageFind();//调用分页方法
				}
			},
			error:function(){
				layer.msg('查询接口异常', {icon: 2});
			}
		});
	})
	
	$(window).one("resize",function(){
		$(".studentAdd_btn").click(function(){//添加课题
			var index = layui.layer.open({
				title : "添加课题信息",
				type : 2,
				content : "../mode/addGroup.jsp", 
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
 
function uptGroup(obj){//修改信息
	var $td = $(obj).parents('tr').children('td');
	var tid = $td.eq(1).text();
	var gname = $td.eq(2).text();
	var tname = $td.eq(3).text();
	var index = layui.layer.open({
		title : "修改课题组信息",
		type : 2,
		content : "../mode/editGroup.jsp", 
		success : function(layero, index){
			var body = layer.getChildFrame('body', index);
		    var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
		    var url = "../../group/selectGroupByMeg";
		    body.find('.gname').text(gname);
		    body.find('.tid').text(tid);
			body.find('.tname').text(tname);
		    $.ajax({	//查找信息数据回填
				  url:url,
				  type:"post", 
				  dataType:"json",
				  async:false,
				  data:{"tid":tid,"gname":gname}, 
				  success:function(data){
					  if(data.flag==1){
						 var str = "";
						 for(var i=0;i<data.list.length;i++){
							 str+= '<tr><td>'+data.list[i].sid+'</td><td>'
							 +data.list[i].sname+'</td><td>'+data.list[i].sex+'</td><td>'+data.list[i].sedu+'</td><td>'+
							 '<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delMember(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;</td></tr>';
						 }
						 body.find('#groupTable').append(str);
					  }else{
						  top.layer.msg("出错");
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

function delGroup(obj){//删除信息
	var $td = $(obj).parents('tr').children('td');
	var tid = $td.eq(1).text();
	var gname = $td.eq(2).text();
	var mes = "确定删除这条的信息?";
	var url = "../../group/delGroup";
	layer.confirm(mes,{btn: ['确定', '取消'],title:"提示"}, function(){
		$.ajax({
			url:url,
			type:"post", 
			dataType:"json",
			async:false,
			data:{"tid":tid,"gname":gname}, 
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
					if(msg==""){
						var url = "../../group/selectGroupT";
					}else{
						var url = "../../group/selGroupT";
					}
			    }else if(type=="admin"){
					if(msg==""){
						var url = "../../group/selectGroup";
					}else{
						var url = "../../group/selGroup";
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
		                      	str+= '<tr><td>'+j+'</td><td style="display:none">'+data.list[i].tid+'</td><td>'+data.list[i].gname+'</td><td>'+data.list[i].tname+'</td><td>'+data.list[i].sname+'</td><td>'+
		                      	'<a class="layui-btn layui-btn-mini news_edit" onclick="uptGroup(this)"><i class="iconfont icon-edit"></i> 修改信息</a>&nbsp;&nbsp;'+
		                      	'<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delGroup(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;';
		                      	j++;
		                      }
		                      $('#groupTable').append(str);
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