package com.cholo.memo.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

	@GetMapping("/user/sigunp/view")
	public String signupView() {
		return "user/signup";
	}
	
}