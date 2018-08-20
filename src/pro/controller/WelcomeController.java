package pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WelcomeController {
	
	@RequestMapping({"/index", "/"})
	public String WelcomeHandle() {
		return "index";
		
	}
	@RequestMapping({"/loginForm"})
	public String LoginFormHandle() {
		return "loginForm";
	}
	@RequestMapping({"/main"})
	public String MainHandle() {
		return "main";
	}
	@RequestMapping({"/regForm"})
	public String RegFormHandle() {
		return "regForm";
	}
	@RequestMapping({"/memberUpdate"})
	public String MemberUpdateHandle() {
		return "memberUpdate";
	}
}
