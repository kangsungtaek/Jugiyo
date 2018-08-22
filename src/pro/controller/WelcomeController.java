package pro.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WelcomeController {
	
	@Autowired
	ServletContext ctx;
	 
	@RequestMapping({"/index", "/"})
	public String WelcomeHandle() {
		System.out.println("[controller:welcome]");
		return "index";
	}

	@RequestMapping("/getAddr")
	public String getAddrHandle(@RequestParam("addr") String addr) {
		System.out.println("[controller:getAddr]" + addr);
		
		return "order/"; //음식점 전체메뉴로 이동하도록

	}
}
