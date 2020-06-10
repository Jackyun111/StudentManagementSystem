<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <title>学生管理系统</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/mycss.css" type="text/css">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
    
    <link type="text/css" href="/bootstrap/css/bootstrap-table.css"/>
    <script type="text/javascript" src="/bootstrap/js/bootstrap-table.js"></script>

    <script>
        function initTable(){
        
        	//先销毁表格
        	$('#cusTable').bootstrapTable('destroy');
        	//初始化表格，动态从数据库中加载数据
        	$('#cusTable').bootstrapTable({
        		method: 'post',
		        contentType: "application/x-www-form-urlencoded",//post请求必须要有！
		        url:"/student/findAllByPage.do",//要请求数据的文件路径
		        striped: true, //是否显示行间隔色
		        pageNumber: 1, //初始化加载第一页，默认第一页
		        pagination:true,//是否分页
		        queryParamsType:'limit',//查询参数组织方式
		        queryParams:queryParams,//请求服务器时所传的参数
		        sidePagination:'server',//指定服务器端分页
		        pageSize:3,//单页记录数
		        pageList:[5,10,20,30],//分页步进值
		        showRefresh:false,//刷新按钮
		        showColumns:false,
		        clickToSelect: true,//是否启用点击选中行
		        toolbarAlign:'right',//工具栏对齐方式
		        buttonsAlign:'right',//按钮对齐方式
		        undefinedText: "空",//当数据为 undefined 时显示的字符  
		        columns:[
		          {
		            title:'全选',
		            field:'select',
		            //复选框
		            checkbox:true,
		            width:25,
		            align:'center',
		            valign:'middle'
		          },
		          {
		          	title:'用户名',
		          	field:'username',
		          	align:'center'
		          },
		          {
		          	title:'姓名',
		          	field:'name',
		          	align:'center'
		          },
		          {
		          	title:'性别',
		          	field:'gender',
		          	align:'center',
		          	formatter:function(value,row,index){
		          		//自定义显示：三个参数
		          		//value:该行的属性
		          		//row:该行的记录
		          		//index:该行的下标
		          		return row.gender==0?'女':'男';
		          	}
		          },
		          {
		          	title:'年龄',
		          	field:'age',
		          	align:'center'
		          },
		          {
		          	title:'班级',
		          	field:'grade',
		          	align:'center',
		          	formatter:function(value,row,index){
		          		return value.gname;
		          	}
		          },
		          {
		          	title:'学科',
		          	field:'course',
		          	align:'center',
		          	formatter:function(value,row,index){
		          		return value.cname;
		          	}
		          },
		          {
		          	title:'操作',
		          	field:'sid',
		          	align:'center',
		          	formatter:actionFormatter
		          }
				]
        	});
        }
        
        function actionFormatter(value,row,index){
        
             let id=value;
             let result='';
             result+='<a class="btn btn-success btn-xs" style="cursor: pointer;" onclick="viewById('+id+')">查看</a>&nbsp;&nbsp;&nbsp;';
             result+='<a class="btn btn-primary btn-xs" style="cursor: pointer;" onclick="editById('+id+')">修改</a>&nbsp;&nbsp;&nbsp;';
             result+='<a class="btn btn-danger btn-xs" style="cursor: pointer;" onclick="deleteById('+id+')">删除</a>&nbsp;&nbsp;&nbsp;';
        	 return result;
        }
        
        function viewById(id){
       	   console.log(id);
	    }
	    function editById(id){
	       console.log(id);
	    }
	    function deleteById(id){
	       console.log(id);
	    }

        function queryParams(params){
        	return {
        		//页号
        		pageNo:(params.offset / params.limit)+1,
        		//页的大小
        		pageSize:params.limit
        	}
        }
    
        $(function(){
        	//alert(1);
        	//初始化表格
        	initTable();
        });
    </script>
    
  </head>
  
  <%request.setAttribute("index", 1); %>
  <body>
    
    <jsp:include page="top.jsp"/>
    <div class="container margin-top-10">
    	<div class="col-sm-8">
    		<div class="panel panel-default">
			  <div class="panel-body">
				<form class="form-inline" method="post">
				  <div class="form-group">
				    <label>姓名:</label>
				    <input type="text" class="form-control input-sm" placeholder="不填查询所有">
				  </div>
				  &nbsp;
				  <div class="form-group">
				    <label>年龄:</label>
				    <input type="text" class="form-control input-sm" style="width:80px" placeholder="最小年龄">&nbsp;&nbsp;---&nbsp;&nbsp;
				    <input type="text" class="form-control input-sm" style="width:80px" placeholder="最大年龄">
				  </div>
				   &nbsp;
				  <div class="form-group">
				    <label>性别:</label>
				    <div class="radio">
					  <label>
					    <input type="radio" value="all" name="sex" checked="checked"> 全部 
					  </label>
					  &nbsp;
					  <label>
					    <input type="radio" value="male" name="sex"> 男
					  </label>
					  &nbsp;
					  <label>
					    <input type="radio" value="female" name="sex"> 女
					  </label>
					</div>
				  </div>
				   <br>
				   <br>
				  <div class="form-group">
			       <label class="control-label">班级：</label>
			         <select class="form-control input-sm" id="selectQuery">
			       	 	<option value="" selected="selected">--查询全部--</option>
			       	 	<c:forEach items="${grades}" var="grade">
			       	 		<option value="${grade.gid}">${grade.gname}</option>
			       	 	</c:forEach>
			       	 </select>
			       	 <label class="control-label">课程：</label>
			         <select class="form-control input-sm" id="selectQuery">
			       	 	<option value="" selected="selected">--查询全部--</option>
			       	 	<c:forEach items="${courses}" var="course">
			       	 		<option value="${course.cid}">${course.cname}</option>
			       	 	</c:forEach>
			       	 </select>
			      </div>
			       &nbsp;
			       <button type="reset" class="btn btn-success btn-sm">重&nbsp;&nbsp;置</button>
			       <button type="submit" class="btn btn-success btn-sm">查&nbsp;&nbsp;询</button>
				</form>
			  	<hr/>
			  	<div class="padding-bottom-3">
			  		<a class="btn btn-info btn-sm" href="#">导出学员信息</a>
			  		<a class="btn btn-info btn-sm" href="#">导入学员信息</a>
			  		<a class="btn btn-success btn-sm" href="addStudent.html" style="display:inline-block;float:right;"
			  			data-toggle="modal" data-target="#addStudent">添加新学员</a>
			  	</div>
			  	
			    <table id="cusTable">
					
					
				</table>
				
			  </div>
			</div>
   		</div>
    	
    	<jsp:include page="right.jsp"/>
   	</div>
    
    <jsp:include page="bottom.jsp" />
    
    <!-- 添加用户model窗口 -->
    <div class="modal fade" id="addStudent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加新学员</h4>
	        <!-- 需要添加的表单  -->
	        <form action="WEB-INF/studentPage/studentMain" class="form-horizontal" method="post">
				     <div class="form-group">
				       <label class="col-sm-3 control-label">登录账户：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="text">
				       </div>
				    </div>
				    <div class="form-group">
				       <label class="col-sm-3 control-label">登录密码：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="text">
				       </div>
				    </div>
				    <div class="form-group">
				       <label class="col-sm-3 control-label">确认密码：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="text">
				       </div>
				    </div>
				     <div class="form-group">
				       <label class="col-sm-3 control-label">学生姓名：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="text">
				       </div>
				    </div>
				     <div class="form-group">
				       <label class="col-sm-3 control-label">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</label>
				       <div class="col-sm-6">
				         <input class="form-control" type="text">
				       </div>
				    </div>
				     <div class="form-group">
				       <label class="col-sm-3 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
				       <div class="col-sm-6">
					       <div class="radio">
							  <label>
							    <input type="radio" value="male" name="sex" checked="checked"> 男
							  </label>
							  &nbsp;&nbsp;&nbsp;
							  <label>
							    <input type="radio" value="female" name="sex"> 女
							  </label>
							</div>
						</div>
				       <label class="col-sm-4 control-label error-info" style="text-align:left;"></label>
				    </div>
				    <div class="form-group">
				       <label class="col-sm-3 control-label">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</label>
				       <div class="col-sm-6">
				         <select class="form-control">
				       	 	<option>-请选择-</option>
				       	 	<option>软件开发一班</option>
				       	 	<option>软件开发二班</option>
				       	 	<option>软件开发三班</option>
				       	 	<option>软件开发四班</option>
				       	 </select>
				       </div>
				    </div>
				    <div class="form-group">
				       <label class="col-sm-3 control-label">课&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;程：</label>
				       <div class="col-sm-6">
				         <select class="form-control">
				       	 	<option>-请选择-</option>
				       	 	<option>java软件开发</option>
				       	 	<option>ios软件开发</option>
				       	 	<option>Android软件开发</option>
				       	 	<option>WEB前端开发</option>
				       	 </select>
				       </div>
				    </div>
				    <div class="form-group">
				       <div class="col-sm-6  col-sm-offset-3">
				       	 <div class="col-sm-6">
					         <button type="reset" class="btn btn-primary btn-block">重&nbsp;&nbsp;置</button>
				       	 </div>
				       	 <div class="col-sm-6">
					         <button type="submit" class="btn btn-primary btn-block">添&nbsp;&nbsp;加</button>
				       	 </div>
				       </div>
				    </div>
			      </form>
	        
	        
	      </div>
	      
	    </div>
	  </div>
	</div>
	<!-- MODEL结束 -->
	
	
  </body>
</html>
