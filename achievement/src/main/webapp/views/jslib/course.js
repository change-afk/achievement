layui.use(['jquery','layer','element','laypage'],function(){
	      window.jQuery = window.$ = layui.jquery;
	      window.layer = layui.layer;
          var element = layui.element(),laypage = layui.laypage;
          
          var pages = 0,groups=0;
          $(document).ready(function() {
      		var url = "../../course/selectCourse";
      		$.ajax({
      			url:url,
      			type:"post", 
      			dataType:"json",
      			async:false,
      		    data:{}, 
      		    success:function(data){
      		    	pages = data.page.totalPage; 
      		    	$('#courseTable tr:gt(0)').remove();//删除之前的数据
                    var str = '';var j=1;
                    //layer.alert(data.list.length);  
                    for(var i=0;i<data.list.length;i++){
                    	str+= '<tr><td><input type="checkbox" id="sel" value="'+data.list[i].cid+'"></td><td style="display:none">'+data.list[i].cid+
                    	'</td><td>'+j+'</td><td>'+data.list[i].cname+'</td><td>'+data.list[i].content+'</td><td>'+data.list[i].creatTime+'</td><td>'+
                    	'<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delCourse(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;'+'</td></tr>';
                    	j++; 
                    }  
                    $('#courseTable').append(str);
      		    },
      		    error:function(){ 
      		    	top.layer.msg("数据查询失败！");
      		    }
      		 });  
      	});
          
          laypage({
					cont: 'page',
					pages: pages ,//总页数
					groups: 3 ,//连续显示分页数
					jump: function(obj, first) {
						//得到了当前页，用于向服务端请求对应数据
						var curr = obj.curr;
						var url = "../../course/selectCourse";
						if(!first) { 
							$.ajax({
				      			url:url,
				      			type:"post", 
				      			dataType:"json",
				      			async:false,
				      		    data:{"currPage":curr}, 
				      		    success:function(data){
				      		    	$('table tbody').empty();
				                    var str = '';var j=1; 
				                    for(var i=0;i<data.list.length;i++){
				                    	str+= '<tr><td><input type="checkbox" id="sel" value="'+data.list[i].cid+'"></td><td style="display:none">'+data.list[i].cid+
				                    	'</td><td>'+j+'</td><td>'+data.list[i].cname+'</td><td>'+data.list[i].content+'</td><td>'+data.list[i].creatTime+'</td><td>'+
				                    	'<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1" onclick="delCourse(this)"><i class="layui-icon"></i> 删除</a>&nbsp;&nbsp;'+'</td></tr>';
				                    	j++; 
				                    } 
				                    $('#courseTable').append(str);
				      		    },
				      		    error:function(){ 
				      		    	top.layer.msg("数据查询失败！");
				      		    }
				      		 });  
						}
					}
				});
    });

layui.use(['form','layer','jquery','laypage'],function(){ 
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		$ = layui.jquery;


	$(window).one("resize",function(){
		$(".passAdd_btn").click(function(){//添加展示
			var index = layui.layer.open({
				title : "添加展示列表",
				type : 2,
				content : "../mode/addCourse.jsp",
				success : function(layero, index){
					setTimeout(function(){
						layui.layer.tips('点击此处返回展示列表', '.layui-layer-setwin .layui-layer-close', {
							tips: 3
						});
					},1000)
				}
			})			
			layui.layer.full(index);
		})
	}).resize();
})

function delCourse(obj){//删除展示
	var ids = new Array();
	var $td = $(obj).parents('tr').children('td');
	var name = $td.eq(3).text();
	var id = $td.eq(1).text();
	var mes = "是否删除"+name+"的展示？";
	var url = "../../course/delCourse";
	layer.confirm(mes,{btn: ['确定', '取消'],title:"提示"}, function(){
		$.ajax({
		       url:url,
		       type:"post", 
			   dataType:"json",
			   async:false,
			   data:{"cid":id}, 
		       success:function(data){		
			    	if(data.flag==1){
			    		layer.msg('展示删除成功', {icon: 1});
			    		location.reload(); 
			    	}else{
			    		layer.msg("展示删除失败",{icon:2});	
			    	}
				} 
		    });
	},function(){
		layer.msg('已取消', {
		    time: 2000, //20s后自动关闭
		  })
	});
}

