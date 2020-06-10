package test;

import java.util.List;

import org.junit.Test;

import com.zte.sms.dao.StudentDao;
import com.zte.sms.entity.Student;
import com.zte.sms.factory.ObjectFactory;

public class StudentDaoTest {
	
	@Test
	public void testStudentDao(){
		StudentDao studentDao = (StudentDao) ObjectFactory.getObject("studentDao");
		List<Student> students = studentDao.selectStudentsByPage();
		for (Student student : students) {
			System.out.println(student);
		}
		
	}

}
