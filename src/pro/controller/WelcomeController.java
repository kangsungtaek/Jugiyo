package pro.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;


@Controller
public class WelcomeController {
	 
	@RequestMapping({"/index", "/"})
	public String WelcomeHandle() {
		System.out.println("[controller:welcome]");
		return "index";
	}
	
	@RequestMapping("/test")
	public String Test() {
		return "test";
	}

	@RequestMapping("/getAddr")
	public String getAddrHandle(@RequestParam("addr") String addr,
			@RequestParam("xcor") double xcor, @RequestParam("ycor") double ycor, WebRequest req) {
		System.out.println("[controller:getAddr]" + addr);
		
		req.setAttribute("addr", addr, WebRequest.SCOPE_SESSION);
		Map map = new HashMap<>();
			map.put("xcor", xcor);
			map.put("ycor", ycor);
		req.setAttribute("coords", map, WebRequest.SCOPE_SESSION);

		return "redirect:/main?type=all"; //음식점 전체메뉴로 이동하도록
	}
	
	@RequestMapping("/error")
	public String errorHandle() {
		return "error";
	}
}
