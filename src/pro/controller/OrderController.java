package pro.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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

import pro.dao.MemberDao;
import pro.dao.MenuDao;
import pro.dao.OrderDao;
import pro.dao.StoreDao;
import pro.service.OrderService;
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
	@Autowired
	MemberDao memberDao;

	@Autowired
	OrderService orderService;

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
					if (i == l.getStoreType())
						continue;
					else
						set[i] = i;
				}
			}
		}
		num = set[1 + (int) Math.random() * set.length];
		return "/main?type=" + num;
	}

	// 주문 확인 페이지
	@GetMapping("/ordered")
	public ModelAndView orderedHandle(WebRequest req, int storeNo) {
		StoreVo vo = storeDao.getStore(storeNo);
		MemberVo member = (MemberVo) req.getAttribute("vo", WebRequest.SCOPE_SESSION);
		ArrayList<MenuVo> orderList = (ArrayList<MenuVo>) req.getAttribute("orderList", WebRequest.SCOPE_SESSION);
		String addr = (String) req.getAttribute("addr", WebRequest.SCOPE_SESSION);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/ordered");
		mav.addObject("addr", addr);
		mav.addObject("member", member);
		mav.addObject("orderList", orderList);
		mav.addObject("storeVo", vo);

		return mav;
	}

	// 주문완료 처리
	@PostMapping("/ordered")
	public ModelAndView orderedHandle2(@RequestParam Map<String, String> map, WebRequest req) {

		ArrayList<MenuVo> orderList = (ArrayList<MenuVo>) req.getAttribute("orderList", WebRequest.SCOPE_SESSION);
		MemberVo mVo = (MemberVo) req.getAttribute("vo", WebRequest.SCOPE_SESSION);

		// map = 배달주소, 휴대폰번호, 주문시요청사항, 결제수단(현금or카드), +@ 할인
		System.out.println(map);

		int totalPrice = 0;

		if (mVo == null) {
			mVo = new MemberVo();
			mVo.setId("nonMember");
			mVo.setAddress(map.get("addr"));
			mVo.setContact(map.get("contact"));
		}
		StoreVo svo = storeDao.getStore(Integer.parseInt((String) map.get("storeNo")));

		Map<String, Object> data = new LinkedHashMap();

		data.put("userId", mVo.getId());
		data.put("storeNo", svo.getNo());
		data.put("storeName", svo.getName());
		data.put("storeType", svo.getType());
		data.put("orderList", orderList);
		data.put("orderdate", new Date());
		// 주문 완료/미완료 = delivery
		data.put("delivery", "N");
		// 주문시 요청사항
		data.put("requested", map.get("requested"));

		orderDao.insertLog(data);

		Map map2 = new HashMap();
		map2.put("user", mVo);
		map2.put("menu", orderList);
		map2.put("mode", "order");

		orderService.sendToOne(map2, svo.getId());

		ModelAndView mav = new ModelAndView();

		if (!mVo.getId().equals("nonMember")) {
			for (MenuVo mVo2 : orderList) {
				totalPrice += (mVo2.getPrice() * mVo2.getCnt());
			}
			double point = totalPrice * 0.05;
			Map memberPoint = new HashMap<>();
			memberPoint.put("id", mVo.getId());
			memberPoint.put("point", point);

			memberDao.updatePoint(memberPoint);
			mav.setViewName("/member/memInfo");
		} else {
			mav.setViewName("main");
		}

		req.removeAttribute("orderList", WebRequest.SCOPE_SESSION);
		req.removeAttribute("totalPrice", WebRequest.SCOPE_SESSION);
		return mav;
	}
}
