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
                      	str+= '<tr><td></td><td>'+j+'</td><td>'+data.list[i].tid+'</td><td>'+data.list[i].tname+'</td><td>'+data.list[i].tprofession+
                      	'</td><td>'+data.list[i].tunit+'</td><td>'+data.list[i].tdegree+'</td><td>'+data.list[i].tmajor+'</td><td>'+
                      	'<a class="layui-btn layui-btn-mini news_edit" onclick="edit(this)"><i class="iconfont icon-edit"></i> 编辑</a>&nbsp;&nbsp;';
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
                    	str+= '<tr><td></td><td>'+j+'</td><td>'+data.list[i].tid+'</td><td>'+data.list[i].tname+'</td><td>'+data.list[i].tprofession+
                      	'</td><td>'+data.list[i].tunit+'</td><td>'+data.list[i].tdegree+'</td><td>'+data.list[i].tmajor+'</td><td>'+
                      	'<a class="layui-btn layui-btn-mini news_edit" onclick="edit(this)"><i class="iconfont icon-edit"></i> 编辑</a>&nbsp;&nbsp;';
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

})
 
function edit(obj){//信息编辑 
	var $td = $(obj).parents('tr').children('td');
	var tid = $td.eq(2).text();
	var tname = $td.eq(3).text();
	var index = layui.layer.open({
		title : "履历管理",
		type : 2,
		content : "../mode/addResume.jsp", 
		success : function(layero, index){ 
			var body = layer.getChildFrame('body', index);
		    var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
			body.find('.tid').text(tid);
			body.find('.tname').text(tname);
			setTimeout(function(){
				layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
					tips: 3
				});
			},1000)
		}
	})			
	layui.layer.full(index);
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
							  str+= '<tr><td></td><td>'+j+'</td><td>'+data.list[i].tid+'</td><td>'+data.list[i].tname+'</td><td>'+data.list[i].tprofession+
		                      	'</td><td>'+data.list[i].tunit+'</td><td>'+data.list[i].tdegree+'</td><td>'+data.list[i].tmajor+'</td><td>'+
		                      	'<a class="layui-btn layui-btn-mini news_edit" onclick="edit(this)"><i class="iconfont icon-edit"></i> 编辑</a>&nbsp;&nbsp;';
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