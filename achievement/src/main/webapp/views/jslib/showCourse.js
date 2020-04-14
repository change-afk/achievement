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
      	    	var url = "../../TeacherCourse/selectTCT";
      	    	$("#teacher").show();
      	    	$("#admin").hide();
      	    	$.ajax({
        			url:url,
        			type:"post",  
        			dataType:"json",
        			async:false,  
        		    data:{"tid":id}, 
        		    success:function(data){
                      var str = '';var j=1;
                      var countMap = eval(data.list);
                    	for ( var map in countMap ){
                    		str+= '<tr><td></td><td>'+j+'</td><td>'+countMap[map].tid+'</td><td>'+countMap[map].tname+
                    		'</td><td>'+countMap[map].cname+'</td><td>'+
                    		'<a class="layui-btn layui-btn-mini news_edit" onclick="edit(this)"><i class="iconfont icon-edit"></i> 编辑</a>&nbsp;&nbsp;';
                    		j++;
                    	}
                      $('#teacherCourseTable').append(str);
        		    },
        		    error:function(){ 
        		    	top.layer.msg("后端查询接口异常！");
        		    }
        		 });  
      	    }else if(type=="admin"){
      	    	var url = "../../TeacherCourse/selectTC";
      	    	$("#admin").show();
      	    	$("#teacher").hide();
      	    	$.ajax({
      	    		url:url,
      	    		type:"post", 
      	    		dataType:"json",
      	    		async:false, 
      	    		data:{}, 
      	    		success:function(data){
      	    			pages = data.page.totalPage; 
      	    			$('#teacherCourseTable tr:gt(0)').remove();//删除之前的数据
      	    			var str = '';var j=1;
      	    			var countMap = eval(data.list);
      	    			for ( var map in countMap ){
      	    				str+= '<tr><td></td><td>'+j+'</td><td>'+countMap[map].tid+'</td><td>'+countMap[map].tname+
      	    				'</td><td>'+countMap[map].cname+'</td><td>'+
      	    				'<a class="layui-btn layui-btn-mini news_edit" onclick="edit(this)"><i class="iconfont icon-edit"></i> 编辑</a>&nbsp;&nbsp;';
      	    				j++;
      	    			}
      	    			$('#teacherCourseTable').append(str);
      	    		},
      	    		error:function(){ 
      	    			top.layer.msg("后端查询接口异常！");
      	    		}
      	    	});  
      	    	pageFind();//调用分页方法
      	    }
        	});
          
    });

layui.use(['form','layer','jquery','laypage'],function(){ 
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		$ = layui.jquery;

	$(".search_btn").click(function(){//查询信息
		var msg = $(".search_input").val().replace(/(^\s*)|(\s*$)/g, "");//去除字符串两边空格
		if(msg==""){
			var url = "../../TeacherCourse/selectTC";
		}else{
			var url = "../../TeacherCourse/selectSearchTC";
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
                     var countMap = eval(data.list);
                   	for ( var map in countMap ){
                   		str+= '<tr><td></td><td>'+j+'</td><td>'+countMap[map].tid+'</td><td>'+countMap[map].tname+
                   		'</td><td>'+countMap[map].cname+'</td><td>'+
                   		'<a class="layui-btn layui-btn-mini news_edit" onclick="edit(this)"><i class="iconfont icon-edit"></i> 编辑</a>&nbsp;&nbsp;';
                   		j++;
                   	}
                     $('#teacherCourseTable').append(str);
                    pageFind();//调用分页方法
				}
			},
			error:function(){
				layer.msg('查询接口异常', {icon: 2});
			}
		});
	})

})
 
function edit(obj){//信息编辑 
	var $td = $(obj).parents('tr').children('td');
	var tid = $td.eq(2).text();
	var tname = $td.eq(3).text();
	var course = $td.eq(4).text();
	var index = layui.layer.open({
		title : "展示内容",
		type : 2,
		area:["800px","425px"],
		content : "../mode/editCourse.jsp", 
		success : function(layero, index){ 
			var body = layer.getChildFrame('body', index);
		    var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
			body.find('.tid').text(tid);
			body.find('.tname').text(tname);
			body.find('.course').text(course); 
			setTimeout(function(){
				layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
					tips: 3
				});
			},1000)
		}
	})			
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
					var url = "../../TeacherCourse/selectTC";
				}else{
					var url = "../../TeacherCourse/selectSearchTC";
				} 
			  if(!first) {  
				  $.ajax({
					  url:url,
					  type:"post",  
					  dataType:"json",
					  async:false,
					  data:{"currPage":curr,"searchMsg":msg}, 
					  success:function(data){
	    		    	  pages = data.page.totalPage; 
	    		    	  $('table tbody').empty();
	                      var str = '';var j=1;
	                      var countMap = eval(data.list);
	                    	for ( var map in countMap ){
	                    		str+= '<tr><td></td><td>'+j+'</td><td>'+countMap[map].tid+'</td><td>'+countMap[map].tname+
	                    		'</td><td>'+countMap[map].cname+'</td><td>'+
	                    		'<a class="layui-btn layui-btn-mini news_edit" onclick="edit(this)"><i class="iconfont icon-edit"></i> 编辑</a>&nbsp;&nbsp;';
	                    		j++;
	                    	}
	                      $('#teacherCourseTable').append(str);
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