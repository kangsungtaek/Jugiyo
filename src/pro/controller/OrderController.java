package pro.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import pro.dao.MenuDao;
import pro.dao.OrderDao;
import pro.dao.StoreDao;
import pro.vo.LogVo;
import pro.vo.MemberVo;
import pro.vo.MenuVo;
import pro.vo.StoreVo;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	OrderDao orderDao;
	@Autowired
	MenuDao menuDao;
	@Autowired
	StoreDao storeDao;

	@GetMapping("/order")
	public ModelAndView OrderHandle01(@RequestParam int storeNo) {
		StoreVo vo = storeDao.getStore(storeNo);
		List<MenuVo> menuList = menuDao.getMenuList(vo.getNo());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/order");
		mav.addObject("storeVo", vo);
		mav.addObject("menuList", menuList);
		return mav;
	}

	@RequestMapping("/random")
	public String randomHandle(WebRequest req) {
		MemberVo member = (MemberVo) req.getAttribute("vo", WebRequest.SCOPE_SESSION);
		List<LogVo> list = new ArrayList();
		list = orderDao.findLog(member.getId());
		System.out.println("[controller:order]" + list);
		int num = 0;
		int[] set = new int[10];
		
		if (list == null || list.size() == 0) {
			for (int i = 1; i < 11; i++) {
				set[i] = i;
			}
		} else {

			for (int i = 1; i < 11; i++) {
				for (LogVo l : list) {
					if (i == l.getStoretype())
						continue;
					else
						set[i] = i;
				}
			}
		}
		num = set[1 + (int) Math.random() * set.length];
		return "/main?type=" + num;
	}
	
	@GetMapping("/ordered")
	public ModelAndView orderedHandle(WebRequest req, int storeNo) {
		StoreVo vo = storeDao.getStore(storeNo);
		MemberVo member = (MemberVo) req.getAttribute("vo", WebRequest.SCOPE_SESSION);
		ArrayList<MenuVo> orderList = (ArrayList<MenuVo>) req.getAttribute("orderList", WebRequest.SCOPE_SESSION);
		String addr = (String)req.getAttribute("addr", WebRequest.SCOPE_SESSION);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/ordered");
		mav.addObject("addr", addr);
		mav.addObject("member", member);
		mav.addObject("orderList", orderList);
		mav.addObject("storeVo", vo);
		
		return mav;
	}
	
	@PostMapping("/ordered")
	public ModelAndView orderedHandle2(@RequestParam Map<String,Object> map, WebRequest req) {
		System.out.println(map);
		ArrayList<MenuVo> orderList = (ArrayList<MenuVo>) req.getAttribute("orderList", WebRequest.SCOPE_SESSION);
		MemberVo vo = (MemberVo)req.getAttribute("login", WebRequest.SCOPE_SESSION);
		String id = vo.getId();
		
		Map<String, Object> data = new LinkedHashMap();
	      data.put("userId", id);
	      data.put("storeNo", map.get("storeNo"));
	      data.put("storeType", map.get("storeType"));
	      data.put("order List", orderList);
	      data.put("orderdate", new Date());
		
	      orderDao.insertLog(data);
	      
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("mian");
	      
		return mav;
	}
}	

