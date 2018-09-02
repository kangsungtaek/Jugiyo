package pro.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import pro.dao.StoreDao;
import pro.vo.StoreVo;

@Controller
public class MainController {

	@Autowired
	StoreDao storeDao;

	@RequestMapping("/main")
	public ModelAndView MainHandle01(@RequestParam(value="type", defaultValue="all", required=true) String type,
			WebRequest req) {
		ModelAndView mav = new ModelAndView();
		System.out.println("[controller:main] type : " + type);

		//List<StoreVo> list = storeDao.storeLIst(type);
		Map<String, Double> map = (Map) req.getAttribute("coords", WebRequest.SCOPE_SESSION);
		List<StoreVo> list = storeDao.getStoreByCoords(map);
		
		mav.setViewName("main");
		mav.addObject("storeList", list);
		
		return mav;
	}

	@RequestMapping("/main/search")
	public ModelAndView searchHandle(@RequestParam("search") String search, WebRequest req) {
		System.out.println("[controller:main] search : " + search);
		Map map = (Map) req.getAttribute("coords", WebRequest.SCOPE_SESSION);
			map.put("search", search);
		ModelAndView mav = new ModelAndView();
		//List<StoreVo> list = storeDao.searchStoreMenu(search);
		
		List<StoreVo> list = storeDao.searchStoreMenuByCoords(map);
		System.out.println("[controller:main] list : " + list);
		mav.setViewName("main");
		mav.addObject("storeList", list);
		
		return mav;
	}
}
