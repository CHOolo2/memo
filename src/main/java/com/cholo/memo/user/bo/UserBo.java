package com.cholo.memo.user.bo;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserBo {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(
			String loginId
			,String password
			,String name
			,String email) {
		
	}
}
