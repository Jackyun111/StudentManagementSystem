package com.zte.sms.service.proxy;

import java.util.List;

import com.zte.sms.entity.Grade;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.GradeService;
import com.zte.sms.transaction.TransactionManager;

public class GradeProxy implements GradeService{

	@Override
	public List<Grade> findAll() {
		// TODO Auto-generated method stub
		TransactionManager tran = (TransactionManager) ObjectFactory.getObject("transaction");
		GradeService gradeService = (GradeService) ObjectFactory.getObject("gradeService");
		List<Grade> grades = null;
		try {
			tran.beginTransaction();
			grades=gradeService.findAll();
			tran.commit();
		} catch (Exception e) {
			// TODO: handle exception
			tran.rollback();
			e.printStackTrace();
		}
		
		return grades;
	}

}
