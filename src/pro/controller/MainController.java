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
import pro.vo.ReviewVo;
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
		Map map = new HashMap<>();
		if(req.getAttribute("vo", WebRequest.SCOPE_SESSION) == null) {
			map = (Map) req.getAttribute("coords", WebRequest.SCOPE_SESSION);
		} else {
			MemberVo member = (MemberVo) req.getAttribute("vo", WebRequest.SCOPE_SESSION);
			map.put("xcor", member.getXcor());
			map.put("ycor", member.getYcor());
		}
		map.put("type", type);
		List<StoreVo> list = storeDao.getStoreByCoords(map);
		
		//평점 : star에 setting해둘것
		for(StoreVo v : list) {
			List<ReviewVo> r = storeDao.findReview(v.getNo());
			double s = 0;
			for(int i=0; i<r.size(); i++) {
				s += r.get(i).getStar();
			}
			if(r.size() == 0) {
				v.setStar(0);
			} else {
				v.setStar(s/r.size());				
			}
			v.setReview(r.size());
		}
		
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
