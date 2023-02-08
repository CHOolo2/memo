package com.cholo.memo.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cholo.memo.common.EncryptUtils;
import com.cholo.memo.user.dao.UserDAO;

@Service
public class UserBo {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(
			String loginId
			, String password
			, String name
			, String email) {
		
		//암호화
		String encrytPassword = EncryptUtils.md5(password);      
		
		return userDAO.insertUser(loginId, encrytPassword, name, email);
		
	}
}
