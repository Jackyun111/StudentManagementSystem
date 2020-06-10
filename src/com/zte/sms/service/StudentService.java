package com.zte.sms.service;

import java.util.List;

import com.zte.sms.entity.Student;
import com.zte.sms.exception.UserOrPassWrongException;
import com.zte.sms.vo.SysuserVO;

public interface StudentService {

	//分页显示学生列表
	public List<Student> findStudentsByPage() ;

	public Student findStudentByUsernameAndPass(SysuserVO sysuserVO) throws UserOrPassWrongException;
}
