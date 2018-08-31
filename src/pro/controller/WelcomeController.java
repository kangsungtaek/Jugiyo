package pro.controller;


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
	public ModelAndView getAddrHandle(@RequestParam("addr") String addr, WebRequest req) {
		System.out.println("[controller:getAddr]" + addr);
		req.setAttribute("addr", addr, WebRequest.SCOPE_SESSION);
		String url = "redirect:/main?type=all";
		return new ModelAndView(url); //음식점 전체메뉴로 이동하도록

	}
}
