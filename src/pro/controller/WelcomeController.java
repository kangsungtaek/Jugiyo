package pro.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;


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
	public ModelAndView getAddrHandle(@RequestParam("addr") String addr, WebRequest req,
			@RequestParam("xcor") double xcor, @RequestParam("ycor") double ycor) {
		System.out.println("[controller:getAddr]" + addr);
		req.setAttribute("addr", addr, WebRequest.SCOPE_SESSION);
		Map<String, Double> map = new HashMap<>();
			map.put("xcor", xcor);
			map.put("ycor", ycor);
		req.setAttribute("cords", map, WebRequest.SCOPE_SESSION);
		String url = "redirect:/main?type=all";
		return new ModelAndView(url); //음식점 전체메뉴로 이동하도록

	}
}
