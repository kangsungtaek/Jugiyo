package pro.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import pro.dao.StoreDao;
import pro.vo.MemberVo;
import pro.vo.StoreVo;

@Controller
public class MainController {

	@Autowired
	StoreDao storeDao;

	@RequestMapping("/main")
	public ModelAndView MainHandle01(@RequestParam(value = "type", defaultValue = "all", required = true) String type,
			WebRequest req, @RequestParam(name = "p", defaultValue = "1") int p) {
		ModelAndView mav = new ModelAndView();
		System.out.println("[controller:main] type : " + type);

		// List<StoreVo> list = storeDao.storeLIst(type);
		Map map = new HashMap<>();
		if (req.getAttribute("vo", WebRequest.SCOPE_SESSION) == null) {
			map = (Map) req.getAttribute("coords", WebRequest.SCOPE_SESSION);
		} else {
			MemberVo member = (MemberVo) req.getAttribute("vo", WebRequest.SCOPE_SESSION);
			map.put("xcor", member.getXcor());
			map.put("ycor", member.getYcor());
			map.put("start", (p - 1) * 10 + 1);
			map.put("end", (p * 10));
		}
		map.put("type", type);
		System.out.println("Main Get :" + map);
		List<StoreVo> list = storeDao.getStoreByCoords(map);

		int tot = 0;

		if (type.equals("all")) {
			System.out.println("type = all");
			tot = storeDao.getTotalCount(map);
			System.out.println("type all cnt :" + tot);
		} else {
			System.out.println("type = " + type);
			tot = storeDao.getTypeTotalCount(map);
			System.out.println("type type cnt :" + tot);
		}


		int min = 1;
		int max = tot / 10 + (tot % 10 > 0 ? 1 : 0);



		/*
		 * Map map = new HashMap<>(); if(req.getAttribute("vo",
		 * WebRequest.SCOPE_SESSION) == null) { map = (Map) req.getAttribute("coords",
		 * WebRequest.SCOPE_SESSION); } else { MemberVo member = (MemberVo)
		 * req.getAttribute("vo", WebRequest.SCOPE_SESSION); map.put("xcor",
		 * member.getXcor()); map.put("ycor", member.getYcor()); } map.put("type",
		 * type); List<StoreVo> list = storeDao.getStoreByCoords(map);
		 */

		mav.setViewName("main");
		mav.addObject("storeList", list);
		mav.addObject("min", min);
		mav.addObject("max", max);
		mav.addObject("current", p);
		mav.addObject("type", type);

		return mav;
	}

	@RequestMapping("/main/search")
	public ModelAndView searchHandle(@RequestParam("search") String search, WebRequest req) {
		System.out.println("[controller:main] search : " + search);
		Map map = (Map) req.getAttribute("coords", WebRequest.SCOPE_SESSION);
		map.put("search", search);
		ModelAndView mav = new ModelAndView();
		// List<StoreVo> list = storeDao.searchStoreMenu(search);

		List<StoreVo> list = storeDao.searchStoreMenuByCoords(map);
		System.out.println("[controller:main] list : " + list);
		mav.setViewName("main");
		mav.addObject("storeList", list);

		return mav;
	}
}
