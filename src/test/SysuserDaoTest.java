package test;

import org.junit.Test;

import com.zte.sms.dao.SysuserDao;
import com.zte.sms.entity.Sysuser;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.vo.SysuserVO;

public class SysuserDaoTest {
	
	@Test
	public void testSysuserDao() {
		SysuserDao sysuserDao = (SysuserDao) ObjectFactory.getObject("sysuserDao");
		
		SysuserVO sysuserVO = new SysuserVO();
		sysuserVO.setUsername("mike");
		sysuserVO.setPassword("123");
		
		Sysuser sysuser = sysuserDao.selectUserByUsernameAndPass(sysuserVO);
		
		System.out.println(sysuser);
		
		
	}
}
