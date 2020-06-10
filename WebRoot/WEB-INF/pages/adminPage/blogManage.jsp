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
  </head>
  
   <%request.setAttribute("index", 4); %>
  <body>
   
   	<jsp:include page="top.jsp"/>
    <div class="container margin-top-10">
    	<div class="col-sm-8">
    		<div class="panel panel-default">
			  <div class="panel-body">
			    <table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>编号</th>
							<th style="width: 60%;">日志标题</th>
							<th>更新时间</th>
							<th>作者</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><a href="blogDatil.html">多参考程序代码</a></td>
							<td>2018/4/17</td>
							<td>mike</td>
							<td>
								<a class="btn btn-danger btn-xs" href="#">删除</a>
							</td>
						</tr>
						<tr>
							<td>2</td>
							<td><a href="blogDatil.html">多参考程序代码</a></td>
							<td>2018/4/17</td>
							<td>mike</td>
							<td>
								<a class="btn btn-danger btn-xs" href="#">删除</a>
							</td>
						</tr>
						<tr>
							<td>3</td>
							<td><a href="blogDatil.html">多参考程序代码</a></td>
							<td>2018/4/17</td>
							<td>mike</td>
							<td>
								<a class="btn btn-danger btn-xs" href="#">删除</a>
							</td>
						</tr>
						<tr>
							<td>4</td>
							<td><a href="blogDatil.html">多参考程序代码</a></td>
							<td>2018/4/17</td>
							<td>mike</td>
							<td>
								<a class="btn btn-danger btn-xs" href="#">删除</a>
							</td>
						</tr>
						<tr>
							<td>5</td>
							<td><a href="blogDatil.html">多参考程序代码</a></td>
							<td>2018/4/17</td>
							<td>mike</td>
							<td>
								<a class="btn btn-danger btn-xs" href="#">删除</a>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5" style="text-align: center;">
							  <ul class="pagination" style="margin: 0px;">
							    <li>
							      <a href="#" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
							    <li class="active"><a href="#">1</a></li>
							    <li><a href="#">2</a></li>
							    <li><a href="#">3</a></li>
							    <li><a href="#">4</a></li>
							    <li><a href="#">5</a></li>
							    <li>
							      <a href="#" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
							  </ul>
							</td>
						</tr>
					</tfoot>
				</table>
			  </div>
			</div>
   		</div>
    	
    	<jsp:include page="right.jsp"/>
   	</div>
    <!-- 页尾 版权声明 -->
    
    <jsp:include page="bottom.jsp"/>
    
  </body>
</html>
