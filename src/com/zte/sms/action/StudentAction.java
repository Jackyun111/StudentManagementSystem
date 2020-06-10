package com.zte.sms.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.zte.sms.constant.Constant;
import com.zte.sms.entity.Course;
import com.zte.sms.entity.Grade;
import com.zte.sms.entity.Student;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.CourseService;
import com.zte.sms.service.GradeService;
import com.zte.sms.service.proxy.StudentProxy;
import com.zte.sms.vo.PageInfo;

public class StudentAction {
	
	public String findStudents(HttpServletRequest request,HttpServletResponse response) {
		
		StudentProxy studentProxy = (StudentProxy) ObjectFactory.getObject("studentProxy");
		List<Student> students = studentProxy.findStudentsByPage();
		request.setAttribute("students", students);
		return "adminMain";
	}
	
	//ajax分页
	public void findStudentsByPage(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		String pageNoStr = request.getParameter("pageNo");
		String pageSizeStr = request.getParameter("pageSize");
		
		int pageNo = pageNoStr==null?1:Integer.parseInt(pageNoStr);
		int pageSize = pageSizeStr==null?2:Integer.parseInt(pageSizeStr);
		
		StudentProxy studentProxy = (StudentProxy) ObjectFactory.getObject("studentProxy");
		PageHelper.startPage(pageNo, pageSize);
		List<Student> students = studentProxy.findStudentsByPage();
		
		PageInfo<Student> pageInfo = new PageInfo<Student>(students);
		response.setContentType(Constant.CONTENT_TYPE);
		response.getWriter().print(JSON.toJSON(pageInfo));
	}
	
	
	//学生管理页面
	public String toStudentManage(HttpServletRequest request,HttpServletResponse response) {
		
		GradeService gradeProxy = (GradeService) ObjectFactory.getObject("gradeProxy");
		CourseService courseProxy = (CourseService) ObjectFactory.getObject("courseProxy"); 
		
		List<Grade> grades = gradeProxy.findAll();
		List<Course> courses = courseProxy.findAll();
		
		/*for (Course course : courses) {
			System.out.println(course);
		}*/
		request.setAttribute("grades", grades);
		request.setAttribute("courses", courses);
		
		
		return "toStudentManage";
	}
}














