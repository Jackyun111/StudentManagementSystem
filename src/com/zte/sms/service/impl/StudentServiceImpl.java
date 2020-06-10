package com.zte.sms.service.impl;

import java.util.List;

import com.zte.sms.dao.StudentDao;
import com.zte.sms.entity.Student;
import com.zte.sms.exception.UserOrPassWrongException;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.StudentService;
import com.zte.sms.vo.SysuserVO;

public class StudentServiceImpl implements StudentService{

	@Override
	public List<Student> findStudentsByPage() {
		// TODO Auto-generated method stub
		StudentDao studentDao = (StudentDao) ObjectFactory.getObject("studentDao");
		List<Student> students = studentDao.selectStudentsByPage();
		return students;
	}

	@Override
	public Student findStudentByUsernameAndPass(SysuserVO sysuserVO) throws UserOrPassWrongException {
		// TODO Auto-generated method stub
		
		StudentDao studentDao = (StudentDao) ObjectFactory.getObject("studentDao");
		Student student = studentDao.selectStudentByUsernameAndPass(sysuserVO);
		if (student == null) {
			throw new UserOrPassWrongException("用户名或密码错误");
		}
		
		return student;
	}

	
}






