package com.zte.sms.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zte.sms.constant.Constant;
import com.zte.sms.entity.Grade;
import com.zte.sms.entity.Student;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.GradeService;
import com.zte.sms.vo.*;

public class GradeAction {

	public String toGradeManage(HttpServletRequest request,HttpServletResponse response) {
		
		return	"toGradeManage";
	}
	
	//ajax分页获取班级信息
	public void findAllByPage(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		String pageNoStr = request.getParameter("pageNo");
		String pageSizeStr = request.getParameter("pageSize");
		
		int pageNo = pageNoStr==null?1:Integer.parseInt(pageNoStr);
		int pageSize = pageSizeStr==null?2:Integer.parseInt(pageSizeStr);
		
		GradeService gradeProxy = (GradeService) ObjectFactory.getObject("gradeProxy");
		PageHelper.startPage(pageNo,pageSize);
		List<Grade> grades = gradeProxy.findAll();
		
		com.zte.sms.vo.PageInfo<Grade> pageInfo =  new com.zte.sms.vo.PageInfo<Grade>(grades);
		response.setContentType(Constant.CONTENT_TYPE);
		response.getWriter().print(JSON.toJSON(pageInfo));
	}
}




