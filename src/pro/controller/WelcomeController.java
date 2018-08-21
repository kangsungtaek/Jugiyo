package pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WelcomeController {
	 
	@RequestMapping({"/index", "/"})
	public String WelcomeHandle() {
		System.out.println("[controller] welcome");
		return "index";
	}
	
	@RequestMapping("/addr")
	public String AddrHandle() {
		System.out.println("[controller] addr");
		return "addr";
	}
	

	@RequestMapping({"/memberUpdate"})
	public String MemberUpdateHandle() {
		return "memberUpdate";

	}
}
