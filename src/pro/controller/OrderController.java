package pro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pro.dao.MenuDao;
import pro.dao.StoreDao;
import pro.vo.MenuVo;
import pro.vo.StoreVo;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	StoreDao storeDao;
	
	@Autowired
	MenuDao menuDao;
	
	@GetMapping("/order")
	public ModelAndView OrderHandle01(@RequestParam String storeNo) {
		StoreVo vo = storeDao.getStore(Integer.parseInt(storeNo));
		List<MenuVo> menuList = menuDao.getMenu(vo.getName());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/order");
		mav.addObject("storeVo", vo);
		mav.addObject("menuList", menuList );
		return mav;
	}

}
