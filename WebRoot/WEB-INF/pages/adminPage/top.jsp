<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script>
    	
    	function showTime(){
    		let d = new Date();
    		let year = d.getYear();
    		let month = d.getMonth();
    		let day = d.getDate();
    		let hour = d.getHours();
    		let minute = d.getMinutes();
    		let second = d.getSeconds();
    		
    		$('#timeId').html('当前时间:'+year+'年'+month+'月'+day+'日'+hour+'时'+minute+'分'+second+'秒');
    	}
    	
    	$(function(){
    		showTime();
    		setInterval(showTime,1000);
    		
    		//正确显示导航栏
    		//逻辑：给每个导航栏加一个索引，遍历，如果是对应的，将其高亮，其余消除高亮显示
    		let navIndex=${index};
    		$('ul.nav li').each(function(i){
    			
    			//alert(i);
    			 //将所有导航栏背景清除
    			$(this).removeClass('active');
    			if(navIndex == i){
    				$(this).addClass('active');
    			} 
    		});
    	});
    
    </script>
    
    
<div class="container nav-height">
   		<div class="col-sm-3">
   			<img alt="" src="/images/logn.png">
   		</div>
   		<div class="col-md-3 col-md-offset-6 visible-md-block visible-lg-block">
   			<p class="p-css" id="timeId"></p>
   		</div>
    </div>
    <div class="nav-style">
    	<div class="container">
	    	<div class="col-sm-12">
	    		<ul class="nav nav-pills">
				  <li class="active"><a href="/student/findAll.do">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</a></li>
				  <li><a href="/student/studentManage.do">学生管理</a></li>
				  <li><a href="/grade/gradeManage.do">班级管理</a></li>
				  <li><a href="/course/courseManage.do">课程管理</a></li>
				  <li><a href="/blog/blogManage.do">日志管理</a></li>
				  <li class="dropdown">
			          <a href="#" data-toggle="dropdown">预留连接 <span class="caret"></span></a>
			          <ul class="dropdown-menu">
			            <li><a href="#">更新个人信息</a></li>
			            <li><a href="#">修改登录密码</a></li>
			            <li role="separator" class="divider"></li>
			            <li><a href="/login.html">退出校园系统</a></li>
			          </ul>
			        </li>
				</ul>
	   		</div>
    	</div>
    </div>