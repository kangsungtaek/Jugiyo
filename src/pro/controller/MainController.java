package pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	@RequestMapping("/main")
	public ModelAndView MainHandle01() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		
		return mav;
	}

}
