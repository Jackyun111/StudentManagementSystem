package com.zte.sms.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.zte.sms.constant.Constant;
import com.zte.sms.entity.Course;
import com.zte.sms.entity.Grade;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.CourseService;
import com.zte.sms.vo.PageInfo;

public class CourseAction {

	public String toCourseManage(HttpServletRequest request,HttpServletResponse response) {
		
		
		return	"toCourseManage";
	}
	
	public void findAllByPage(HttpServletRequest request,HttpServletResponse response) throws IOException {
	

		String pageNoStr = request.getParameter("pageNo");
		String pageSizeStr = request.getParameter("pageSize");
		
		int pageNo = pageNoStr==null?1:Integer.parseInt(pageNoStr);
		int pageSize = pageSizeStr==null?2:Integer.parseInt(pageSizeStr);
		
		CourseService courseProxy = (CourseService) ObjectFactory.getObject("courseProxy");
		List<Course> courses = courseProxy.findAll();
		
		/*for (Course course : courses) {
			System.out.println(course);
		}*/
		com.zte.sms.vo.PageInfo<Course> pageInfo =  new com.zte.sms.vo.PageInfo<Course>(courses);
		response.setContentType(Constant.CONTENT_TYPE);
		response.getWriter().print(JSON.toJSON(pageInfo));
	}
	
}
