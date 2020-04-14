<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成果信息</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css" href="../common/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css" href="../common/bootstrap/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css" href="../common/global.css" media="all">
<link rel="stylesheet" type="text/css" href="../css/personal.css" media="all">
</head>
<body>
	<section class="layui-larry-box">
	<div class="larry-personal">
		<div class="layui-tab" style="min-height:400px;">
		<form class="layui-form" id="myForm">
			<blockquote class="layui-elem-quote news_search" style="height:70px">
				<div class="layui-form layui-card-header layuiadmin-card-header-auto" style="background-color: #F2F2F2;">
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">工号</label>
							<div class="layui-input-block">
								<input type="text" name="id" placeholder="请输入" autocomplete="off" class="layui-input tid">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">姓名</label>
							<div class="layui-input-block">
								<input type="text" name="username" placeholder="请输入" autocomplete="off" class="layui-input tname">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">成果类型</label>
							<div class="layui-input-block" id="type">
								<!-- <select name="sex" >
									<option value="0">不限</option>
									<option value="1">男</option>
									<option value="2">女</option>
								</select> -->
							</div>
						</div>
						<div class="layui-inline">
							<a class="layui-btn search_btn">查询</a>
						</div>
						<div class="layui-inline">
							<a class="layui-btn layui-btn-normal add_btn">添加成果</a>
						</div>
						<div class="layui-inline">
							<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
						</div>
					</div>
				</div>
			</blockquote>
			</form>
			<div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
				<div class="layui-tab-item layui-field-box layui-show">
					<table class="layui-table table-hover" lay-even="" lay-skin="nob">
						<thead>
							<tr>
								<td></td>
								<td style="display: none">ID</td>
								<td>ID</td>
								<td>姓名</td>
								<td>工号</td>
								<td>成果标题</td>
								<td>成果类型</td>
								<td>操作</td>
							</tr>
						</thead>
						<tbody id="contenTable"></tbody>
					</table>
					<div class="larry-table-page clearfix">
						<div id="page" class="page"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
</body>
	<script type="text/javascript" src="../common/layui/layui.js"></script>
	<script type="text/javascript" src="../jslib/content.js"></script>
</html>