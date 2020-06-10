package com.zte.sms.service.proxy;

import java.util.List;

import com.zte.sms.entity.Student;
import com.zte.sms.exception.UserOrPassWrongException;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.StudentService;
import com.zte.sms.transaction.TransactionManager;
import com.zte.sms.vo.SysuserVO;

public class StudentProxy implements StudentService{

	@Override
	public List<Student> findStudentsByPage() {
		// TODO Auto-generated method stub
		TransactionManager tran = (TransactionManager) ObjectFactory.getObject("transaction");
		StudentService studentService = (StudentService) ObjectFactory.getObject("studentService");
		List<Student> students = null;
		try {
			tran.beginTransaction();
			students = studentService.findStudentsByPage();
			tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tran.rollback();
		}
		
		return students;
	}

	@Override
	public Student findStudentByUsernameAndPass(SysuserVO sysuserVO) throws UserOrPassWrongException {
		// TODO Auto-generated method stub
		TransactionManager tran = (TransactionManager) ObjectFactory.getObject("transaction");
		StudentService studentService = (StudentService) ObjectFactory.getObject("studentService");
		Student student = null;
		try {
			tran.beginTransaction();
			student = studentService.findStudentByUsernameAndPass(sysuserVO);
			tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			tran.rollback();
			throw e;
		}
		return student;
	}

	
	
}
