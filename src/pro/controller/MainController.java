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
	public ModelAndView MainHandle01(@RequestParam(name="type", defaultValue="all", required=true) String type) {
		
		List<StoreVo> list = storeDao.storeLIst(type);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("storeList",list);
		
		return mav;
	}

}
