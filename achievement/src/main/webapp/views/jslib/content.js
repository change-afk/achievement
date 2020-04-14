var pages = 0,groups=0, cid = 0;
layui.use(['jquery','layer','element','laypage'],function(){
	      window.jQuery = window.$ = layui.jquery;
	      window.layer = layui.layer;
          var element = layui.element(),laypage = layui.laypage;
          
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
       	    	var url = "../../content/selectContentT"; 
       	    }else if(type=="admin"){
       	    	var url = "../../content/selectContent";
       	    }
      		$.ajax({
      			url:url,
      			type:"post", 
      			dataType:"json",
      			async:false, 
      		    data:{"tid":id}, 
      		    success:function(data){
      		    	pages = data.page.totalPage; 
      		    	$('#passTable tr:gt(0)').remove();//删除之前的数据
                    var str = '';var j=1;
                    //layer.alert(data.list.length);  
                    for(var i=0;i<data.list.length;i++){
                    	str+= '<tr><td><input type="checkbox" id="sel" value="'+data.list[i].tcoid+'"></td><td style="display:none">'+data.list[i].tcoid+
                    	'</td><td>'+j+'</td><td>'+data.list[i].tname+
                    	'</td><td>'+data.list[i].tid+'</td><td>'+data.list[i].tcname+'</td><td>'+data.list[i].cname+'</td><td>'+
                    	'<a class="layui-btn layui-btn-mini news_edit" onclick="uptContent(this)"><i class="iconfont icon-edit"></i> 修改</a>&nbsp;&nbsp;'+
                    	'<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delContent(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;'+'</td></tr>'
                    	j++;
                    }
                    $('#contenTable').append(str);
      		    },
      		    error:function(){ 
      		    	top.layer.msg("数据查询失败！");
      		    }
      		 });
      		
      		url = "../../course/selectAllCourse";
    		$.ajax({
    			url:url,
    			type:"post", 
    			dataType:"json",
    			async:false, 
    			data:{}, 
    			success:function(data){		
    				var str='<select name="type" lay-filter="type">';  
    				str+='<option value="0">不限</option>'
    				for(var i=0;i<data.list.length;i++){
    					str+='<option value="'+data.list[i].cid+'">'+data.list[i].cname+'</option>';
    				}
    				str+='</select>'; 
    				$('#type').append(str);
    				document.getElementById("myForm").reset()
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
	
	form.on('select(type)', function(data){
		cid=data.value;
    });
	
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
  	    var type=theRequest.type;var tid = "";var tname ="";
		if(type=="admin"){
			tid = $(".tid").val().replace(/(^\s*)|(\s*$)/g, "");//去除字符串两边空格
			tname = $(".tname").val().replace(/(^\s*)|(\s*$)/g, "");//去除字符串两边空格
			if(tid==""&&tname==""&&cid==0){
				var url = "../../content/selectContent"; 
			}else{
				var url = "../../content/search";
			}
		}else if(type=="teacher"){
			tid = id;
			if(cid==0){
				var url = "../../content/selectContentT"; 
			}else{
				var url = "../../content/search";
			}
		}
		$.ajax({
			url:url,
			type:"post", 
			dataType:"json",
			async:false,
			data:{"tid":tid,"tname":tname,"cid":cid}, 
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
                    	str+= '<tr><td><input type="checkbox" id="sel" value="'+data.list[i].tcoid+'"></td><td style="display:none">'+data.list[i].tcoid+
                    	'</td><td>'+j+'</td><td>'+data.list[i].tname+
                    	'</td><td>'+data.list[i].tid+'</td><td>'+data.list[i].tcname+'</td><td>'+data.list[i].cname+'</td><td>'+
                    	'<a class="layui-btn layui-btn-mini news_edit" onclick="uptContent(this)"><i class="iconfont icon-edit"></i> 修改</a>&nbsp;&nbsp;'+
                    	'<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delContent(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;'+'</td></tr>'
                    	j++;
                    }
                    $('#contenTable').append(str);
                    pageFind();//调用分页方法
				}
			},
			error:function(){
				layer.msg('查询接口异常', {icon: 2});
			}
		});
	})
	
	$(".batchDel").click(function(){//批量删除
		var ids = new Array();
        $("input:checkbox[id='sel']:checked").each(function(i){
           ids[i] = $(this).val();
         });
		if(ids==""){
			layer.msg("请选择要删除的信息");
		}else{
			var url = "../../content/delContent";
			layer.confirm("确定删除选中内容？",{btn: ['确定', '取消'],title:"提示"}, function(){
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
		$(".add_btn").click(function(){//添加成果
			var index = layui.layer.open({
				title : "添加成果",
				type : 2,
				content : "../mode/addContent.jsp",
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

function uptContent(obj){//修改内容
	var $td = $(obj).parents('tr').children('td');
	var tcoid = $td.eq(1).text();
	var index = layui.layer.open({
		title : "修改成果信息",
		type : 2,
		content : "../mode/editContent.jsp", 
		success : function(layero, index){
			var body = layer.getChildFrame('body', index);
		    var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
		    var url = "../../content/selContentById";
		    $.ajax({	//查找信息数据回填
				  url:url,
				  type:"post", 
				  dataType:"json",
				  async:false,
				  data:{"tcoid":tcoid}, 
				  success:function(data){
					  if(data.flag==1){
						  body.find('.tcoid').text(data.content.tcoid);
						  body.find('.tcname').text(data.content.tcname);
						  body.find('.tid').text(data.content.tid);
						  body.find('.type').text(data.content.cname);
						  body.find('.tcontent').text(data.content.tcontent);
						  if(data.content.cname=="论文成果"){
							  body.find('#lwcg').show();
							  body.find('.sendname').val(data.content.sendname);
							  body.find('.sendtype').val(data.content.sendtype);
							  body.find('.sendtime').val(data.content.sendtime);
						  }else if(data.content.cname=="科研成果"){
							  body.find('#kycg').show();
							  body.find('.creatime').val(data.content.creatime);
							  body.find('.comefrom').val(data.content.comefrom);
							  body.find('.money').val(data.content.money); 
							  body.find('.outschool').val(data.content.outschool); 
						  }else if(data.content.cname=="专利成果"){
							  body.find('#zlcg').show();
							  body.find('.belongunit').val(data.content.belongunit);
							  body.find('.belongtype').val(data.content.belongtype);
							  body.find('.belongnum').val(data.content.belongnum);
							  body.find('.belongtime').val(data.content.belongtime);
						  }
					  }else
						  top.layer.msg(data.msg);
					  
				  }, 
				  error:function(){ 
					  top.layer.msg("后端查询接口异常！");
				  }
			  });  
		   // body.find('.tid').val(tid);
		    
			setTimeout(function(){
				layui.layer.tips('点击此处返回账号列表', '.layui-layer-setwin .layui-layer-close', {
					tips: 3
				});
			},1000)
		}
	})			
	layui.layer.full(index);
}

function delContent(obj){//删除账号
	var ids = new Array();
	var $td = $(obj).parents('tr').children('td');
	var tcoid = $td.eq(1).text();
	ids.push(tcoid);
	var mes = "确认删除这条信息？";
	var url = "../../content/delContent";
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
			    		layer.msg('删除成功', {icon: 1});
			    		location.reload(); 
			    	}else{
			    		layer.msg("删除失败",{icon:2});	
			    	}
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
		  	    var type=theRequest.type;var tid = "";var tname ="";
		  	    var tid = $(".tid").val().replace(/(^\s*)|(\s*$)/g, "");//去除字符串两边空格
				var tname = $(".tname").val().replace(/(^\s*)|(\s*$)/g, "");//去除字符串两边空格
				if(type=="admin"){
					tid = $(".tid").val().replace(/(^\s*)|(\s*$)/g, "");//去除字符串两边空格
					tname = $(".tname").val().replace(/(^\s*)|(\s*$)/g, "");//去除字符串两边空格
					if(tid==""&&tname==""&&cid==0){
						var url = "../../content/selectContent"; 
					}else{
						var url = "../../content/search";
					}
				}else if(type=="teacher"){
					tid = id;
					if(cid==0){
						var url = "../../content/selectContentT"; 
					}else{
						var url = "../../content/searchT";
					}
				}
			  if(!first) { 
				  $.ajax({
					  url:url,
					  type:"post", 
					  dataType:"json",
					  async:false,
					  data:{"currPage":curr,"tid":tid,"tname":tname,"cid":cid},  
					  success:function(data){
						  $('table tbody').empty();
						  var str = '';var j=1; 
						  for(var i=0;i<data.list.length;i++){
							  str+= '<tr><td><input type="checkbox" id="sel" value="'+data.list[i].tcoid+'"></td><td style="display:none">'+data.list[i].tcoid+
		                    	'</td><td>'+j+'</td><td>'+data.list[i].tname+
		                    	'</td><td>'+data.list[i].tid+'</td><td>'+data.list[i].tcname+'</td><td>'+data.list[i].cname+'</td><td>'+
		                    	'<a class="layui-btn layui-btn-mini news_edit" onclick="uptContent(this)"><i class="iconfont icon-edit"></i> 修改</a>&nbsp;&nbsp;'+
		                    	'<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delContent(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;'+'</td></tr>'
		                    	j++;
						  }
						  $('#contenTable').append(str);
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
