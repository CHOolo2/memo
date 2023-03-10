package com.cholo.memo.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cholo.memo.user.bo.UserBo;

@RestController //Controller + ResponseBody
public class UserRestController {
	
	@Autowired
	private UserBo userBO;
	
	//회원가입 API
	@PostMapping("/user/signup")
	public Map<String, String> sigunp(
		@RequestParam("loginId")String loginId
		,@RequestParam("password") String password
		,@RequestParam("name")String name
		,@RequestParam("email") String email){
		
		int count = userBO.addUser(loginId, password, name, email);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
}
