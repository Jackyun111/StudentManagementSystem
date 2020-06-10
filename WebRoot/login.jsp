<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>学生管理系统</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css" type="text/css"></link>
    <link rel="stylesheet" href="/css/mycss.css" type="text/css"></link>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
  </head>
  <body>
  	<!-- 使用自定义css样式 div-signin 完成元素居中-->
    <div class="container div-signin">
      <div class="panel panel-primary div-shadow">
      	<!-- h3标签加载自定义样式，完成文字居中和上下间距调整 -->
	    <div class="panel-heading">
	    	<h3>学生管理系统 3.0</h3>
	    	<span>Student Management System</span>
	    </div>
	    <div class="panel-body">
	      <!-- login form start -->
	      <form action="/sysuser/login.do" class="form-horizontal" method="post" id="frmLogin">
	     
		     <div class="form-group">
		       <label class="col-sm-3 control-label">用户名：</label>
		       <div class="col-sm-9">
		         <input class="form-control" type="text" placeholder="请输入用户名" name="username">
		       </div>
		    </div>
		     <div class="form-group">
		       <label class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
		       <div class="col-sm-9">
		         <input class="form-control" type="password" placeholder="请输入密码" name="password">
		       </div>
		    </div>
		     <div class="form-group">
		       <label class="col-sm-3 control-label">身&nbsp;&nbsp;&nbsp;&nbsp;份：</label>
		       <div class="col-sm-9">
		       	 <select class="form-control" name="state">
		       	 	<option>-请选择身份-</option>
		       	 	<option value="0">学生</option>
		       	 	<option value="1">管理员</option>
		       	 </select>
		       </div>
		    </div>
		     <div class="form-group">
		       <label class="col-sm-3 control-label">验证码：</label>
		       <div class="col-sm-4">
		         <input class="form-control" type="text" placeholder="请输入验证码">
		       </div>
		       <div class="col-sm-2">
		       	  <!-- 验证码图片加载（需引入验证码文件）图像高度经过测试，建议不要修改 -->
			      <img class="img-rounded" src="images/image.jpg" alt="验证码" style="height: 32px; width: 70px;"/>
		       </div>
		       <div class="col-sm-2">
		         <button type="button" class="btn btn-link">看不清</button>
		       </div>
		    </div>
		    <div class="form-group">
		       <div class="col-sm-3">
			        <button type="button" class="btn btn-link btn-block" data-toggle="modal" data-target="#registModal">注册账号</button>
		       </div>
		       <div class="col-sm-9 padding-left-0">
		       	 <div class="col-sm-4">
			         <button type="submit" class="btn btn-primary btn-block">登&nbsp;&nbsp;陆</button>
		       	 </div>
		       	 <div class="col-sm-4">
			         <button type="reset" class="btn btn-primary btn-block">重&nbsp;&nbsp;置</button>
		       	 </div>
		       	 <div class="col-sm-4">
			         <button type="button" class="btn btn-link btn-block">忘记密码？</button>
		       	 </div>
		       </div>
		    </div>
	      </form>
	      <!-- login form end -->
	    </div>
	  </div>
    </div>
    <!-- 页尾 版权声明 -->
    <div class="container">
		<div class="col-sm-12 foot-css">
		        <p class="text-muted credit">
		            Copyright © 2018 中兴软件 版权所有
		        </p>
	    </div>
    </div>

    <!-- 注册账号modal -->
	<div class="modal fade" id="registModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">注册账号</h4>
	      </div>
	      <div class="modal-body">
	        <form id="frmRegist" class="form-horizontal" method="post" action="">
		        <div class="form-group">
		            <label class="control-label col-sm-3">用户名</label>
		            <div class="col-sm-6">
		                <input type="text" class="form-control" name="username" />
		            </div>
		             <label class="col-sm-3 control-label error-info" style="text-align:left;">*不可为空</label>
		        </div>
		        <div class="form-group">
		            <label class="control-label col-sm-3">密码</label>
		            <div class="col-sm-6">
		                <input type="password" class="form-control" name="password" />
		            </div>
		             <label class="col-sm-3 control-label error-info" style="text-align:left;">*不可为空</label>
		        </div>
		        <div class="form-group">
		            <label class="control-label col-sm-3">确认密码</label>
		            <div class="col-sm-6">
		                <input type="password" class="form-control" name="repassword" />
		            </div>
		             <label class="col-sm-3 control-label error-info" style="text-align:left;">*不可为空</label>
		        </div>
		        <div class="form-group">
		            <div class="col-sm-6 col-sm-offset-3">
		                <div class="checkbox">
		                    <input type="checkbox" name="protocol" /> 同意相关服务条款和隐私政策
		                </div>
		            </div>
		        </div>
		    </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关&nbsp;&nbsp;&nbsp;&nbsp;闭</button>
	        <button type="submit" class="btn btn-default">注&nbsp;&nbsp;&nbsp;&nbsp;册</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 注册账号modal结束 -->
  </body>
</html>
