package com.zte.sms.dao;

import java.util.List;

import com.zte.sms.entity.Student;
import com.zte.sms.entity.Sysuser;
import com.zte.sms.vo.SysuserVO;

public interface StudentDao {
	
	public List<Student> selectStudentsByPage() ;

	//根据用户名和密码查询记录
	public Student selectStudentByUsernameAndPass(SysuserVO sysuserVO) ;
}
