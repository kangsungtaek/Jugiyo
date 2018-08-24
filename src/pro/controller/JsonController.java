package pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import pro.dao.MenuDao;
import pro.vo.MenuVo;

@Controller
public class JsonController {
	
	
	@Autowired
	MenuDao menuDao;
	
	@RequestMapping("/sendJson")
	public ModelAndView JsonController(@RequestParam int no, WebRequest webRequest ) {
		
		MenuVo vo = menuDao.getMenu(no);
		System.out.println(vo);
		webRequest.setAttribute("orderList", vo, WebRequest.SCOPE_SESSION);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/sendJson");
		return mav;
	}

}
