package pro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pro.dao.StoreDao;
import pro.vo.StoreVo;

@Controller
public class MainController {

	@Autowired
	StoreDao storeDao;

	@RequestMapping("/main")
	public ModelAndView MainHandle01(@RequestParam String type) {
		ModelAndView mav = new ModelAndView();
		
		List<StoreVo> list = storeDao.storeLIst(type);
		
		mav.setViewName("main");
		mav.addObject("storeList", list);
		
		return mav;
	}

	@RequestMapping("/main/search")
	public ModelAndView searchHandle(@RequestParam("search") String search) {
		System.out.println("[controller:order] search : " + search);
		
		ModelAndView mav = new ModelAndView();
		List<StoreVo> list = storeDao.searchStoreMenu(search);
		mav.setViewName("main");
		mav.addObject("storeList", list);
		
		return mav;
	}
}
