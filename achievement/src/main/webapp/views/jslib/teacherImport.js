layui.use('upload', function(){
  var $ = layui.jquery,
  upload = layui.upload; 

  //文件列表示例
  var num="" ;var show ="";
  var demoListView = $('#demoList'),
  uploadListIns = upload.render({
    elem: '#cfile',
    url: '../../teacher/import',
    accept: 'file',
    multiple: true,
    auto: false,
    bindAction: '#uploadBegin',
    choose: function(obj){   
      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
      //读取本地文件
      obj.preview(function(index, file, result){
        var tr = $(['<tr id="upload-'+ index +'">'
          ,'<td id="filename">'+ file.name +'</td>'
          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
          ,'<td>等待上传</td>'
          ,'<td>'
            ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
          ,'</td>'
        ,'</tr>'].join(''));
         
        //删除
        tr.find('.demo-delete').on('click', function(){
          delete files[index]; //删除对应的文件
          tr.remove();
          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
        });
        demoListView.append(tr);
      });
    },
    before:function(){
    	var filenum = $("tr").length;
    	var file = $("#filename").text();
    	var ext = file.slice(file.lastIndexOf(".")+1).toLowerCase();  
		if(filenum>2){
			layer.msg("一次只能上传一个文件");  
			return false;
		}
    	if(file==null || file ==""){
			layer.msg("请选择文件");  
			return false;  
		}
		else if (("xls" != ext)&&("xlsx" != ext) ) {  
	        layer.msg("所选择文件不规范");  
	        return false; 
	    }
	},
    done: function(res, index, upload){
    	show = layer.msg('上传中，请稍候',{icon: 16,time:true,shade:0.8});
      if(res.code == 0){ //上传成功
    	var tr = demoListView.find('tr#upload-'+ index),
    	tds = tr.children(); 
        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
        //tds.eq(3).html(''); //清空操作
        return delete this.files[index]; //删除文件队列已经上传成功的文件
      }
      this.error(index, upload,res);
      layer.close(show);
    }, 
    error: function(index, upload,res){
      var tr = demoListView.find('tr#upload-'+ index),
      tds = tr.children(); 
      tds.eq(2).html('<span style="color: #FF5722;">上传失败:'+res.msg+'</span>');
      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
   }
  });
	
	$(window).one("resize",function(){
		$(".import").click(function(){//上传按钮
			var file=document.getElementById("teacherFile").value; 
			var ext = file.slice(file.lastIndexOf(".")+1).toLowerCase();  
			if(file==null || file ==""){
				layer.msg("请选择文件");  
			}
			else if (("xls" != ext)&&("xlsx" != ext) ) {  
		        layer.msg("所选择文件不规范");  
		        return false;  
		    }
			else {
				layer.msg("选择文件规范");  
			}
		})
		
	}).resize();
})
