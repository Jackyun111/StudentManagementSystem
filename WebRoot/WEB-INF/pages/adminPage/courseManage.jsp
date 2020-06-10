<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <title>学生管理系统</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css" type="text/css"></link>
    <link rel="stylesheet" href="/css/mycss.css" type="text/css"></link>
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
		        url:"/course/findAllByPage.do",//要请求数据的文件路径
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
		          	title:'课程名称',
		          	field:'cname',
		          	align:'center'
		          },
		          {
		          	title:'课程描述',
		          	field:'cdesc',
		          	align:'center'
		          },
		          {
		          	title:'操作',
		          	field:'cid',
		          	align:'center',
		          	formatter:actionFormatter
		          }
				]
        	});
        }
        
       function actionFormatter(value,row,index){
        
             let id=value;
             let result='';
             result+='<a class="btn btn-success btn-xs" style="cursor: pointer;" onclick="viewById('+id+')">启用</a>&nbsp;&nbsp;&nbsp;';
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
    	
    		//alert(0);
    		initTable();
    	});
    
    </script>
  </head>
  
   <%request.setAttribute("index", 3); %>
  <body>
    
    <jsp:include page="top.jsp" />
    
    <div class="container margin-top-10">
    	<div class="col-sm-8">
    		<div class="panel panel-default">
			  <div class="panel-body">
			  	<div class="padding-bottom-3" style="text-align: right;">
			  		<button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#addCourse" >增开新课程</button>
			  	</div>
			     <table id="cusTable">
					
				</table>
			  </div>
			</div>
   		</div>
    	
    	<jsp:include page="right.jsp"/>
   	</div>
    <!-- 页尾 版权声明 -->
    
    <jsp:include page="bottom.jsp" />
   
	<!-- 课程修改model窗口 -->
    <div class="modal fade" id="modfiyCourse" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">课程信息修改</h4>
	      </div>
	      <form action="" class="form-horizontal" method="post">
		      <div class="modal-body">
				<div class="form-group">
			       <label class="col-sm-3 control-label">课程编号：</label>
			       <div class="col-sm-6">
			         <input class="form-control" type="text" value="1" readonly="readonly">
			       </div>
			       <label class="col-sm-3 control-label error-info" style="text-align:left;">*不可修改</label>
			    </div>
			     <div class="form-group">
			       <label class="col-sm-3 control-label">课程名称：</label>
			       <div class="col-sm-6">
			         <input class="form-control" type="text" value="java软件开发">
			       </div>
			       <label class="col-sm-3 control-label error-info" style="text-align:left;">*不能为空</label>
			    </div>
			     <div class="form-group">
			       <label class="col-sm-3 control-label">课程描述：</label>
			       <div class="col-sm-6">
			         <textarea class="form-control" rows="10" style="resize:none;">a、JAVA程序设计
b、SQL SERVER 高级应用
c、jQuery高级编程
d、HTML5与CSS3开发
e、Oracle数据库应用
			         </textarea>
			       </div>
			       <label class="col-sm-3 control-label error-info" style="text-align:left;">*不能为空</label>
			    </div>
		      </div>
		      <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">关&nbsp;&nbsp;闭</button>
		          <button type="reset" class="btn btn-default">重&nbsp;&nbsp;置</button>
		          <button type="submit" class="btn btn-default">修&nbsp;&nbsp;改</button>
			  </div>
		  </form>
	    </div>
	  </div>
	</div>
	<!-- MODEL结束 -->
	<!-- 课程添加model窗口 -->
    <div class="modal fade" id="addCourse" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">新课程添加</h4>
	      </div>
	      <form action="" class="form-horizontal" method="post">
		      <div class="modal-body">
			     <div class="form-group">
			       <label class="col-sm-3 control-label">课程名称：</label>
			       <div class="col-sm-6">
			         <input class="form-control" type="text">
			       </div>
			       <label class="col-sm-3 control-label error-info" style="text-align:left;">*不能为空</label>
			    </div>
			    <div class="form-group">
			       <label class="col-sm-3 control-label">课程描述：</label>
			       <div class="col-sm-6">
			         <textarea class="form-control" rows="10" style="resize:none;"></textarea>
			       </div>
			       <label class="col-sm-3 control-label error-info" style="text-align:left;">*不能为空</label>
			    </div>
		      </div>
		      <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">关&nbsp;&nbsp;闭</button>
		          <button type="reset" class="btn btn-default">重&nbsp;&nbsp;置</button>
		          <button type="submit" class="btn btn-default">添&nbsp;&nbsp;加</button>
			  </div>
		  </form>
	    </div>
	  </div>
	</div>
	<!-- MODEL结束 -->
  </body>
</html>
