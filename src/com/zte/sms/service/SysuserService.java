package com.zte.sms.service;

import com.zte.sms.entity.Sysuser;
import com.zte.sms.exception.OldPassWrongException;
import com.zte.sms.exception.UserOrPassWrongException;
import com.zte.sms.vo.SysuserVO;

public interface SysuserService {

	//根据用户名和密码查询记录
	public Sysuser findUserByUsernameAndPass(SysuserVO sysuserVO) throws UserOrPassWrongException;

	public Sysuser findUserByIdAndPass(SysuserVO sysuserVO) throws OldPassWrongException;

	public void modifyPassById(SysuserVO sysuserVO);
}
