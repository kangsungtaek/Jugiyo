package pro.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import pro.dao.MenuDao;
import pro.dao.OrderDao;
import pro.dao.StoreDao;
import pro.service.UploadService;
import pro.vo.LogVo;
import pro.vo.MenuAttachVo;
import pro.vo.MenuVo;
import pro.vo.MultiMenuVo;
import pro.vo.ReviewVo;
import pro.vo.StoreVo;

@Controller
@RequestMapping("/owner")
public class OwnerController {
	@Autowired
	MenuDao menuDao;
	@Autowired
	UploadService uploadService;
	@Autowired
	StoreDao storeDao;
	@Autowired
	OrderDao orderDao;
	@Autowired
	Gson gson;

	// 사장님 페이지
	@GetMapping("/index")
	public String indexHandle01(WebRequest webRequest) {
		StoreVo vo = (StoreVo) webRequest.getAttribute("storeVo", WebRequest.SCOPE_SESSION);
		List<LogVo> lVo = orderDao.findStore(vo.getNo());
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date= new Date();
		String today = sdf.format(date);
		int price=0;
		for(int i = 0; i < lVo.size(); i++) {
			Date d = lVo.get(i).getOrderdate();
			sdf.format(d);
			if(today.equals(d)) {
				price+=lVo.get(i).getTotalPrice();
			}
		}
		
		
		return "owner/index";
	}

	@RequestMapping("/logout")
	public String logoutHandle(WebRequest req) {
		req.setAttribute("storeVo", null, WebRequest.SCOPE_SESSION);
		return "/index";
	}

	// 메뉴추가 컨트롤러
	@GetMapping("/addmenu")
	public ModelAndView addMenuHandle01() {

		ModelAndView mav = new ModelAndView();
		List<Map> menuType = menuDao.findAll();
		System.out.println("menuType" + menuType);
		mav.setViewName("owner/addmenu");
		mav.addObject("menuTypeList", menuType);

		return mav;
	}

	// @RequestParam("file")MultipartFile[] files

	@PostMapping("/addmenu")
	public ModelAndView indexHandle02(@ModelAttribute MultiMenuVo menus, WebRequest webRequest) throws Exception {

		StoreVo store = (StoreVo) webRequest.getAttribute("storeVo", WebRequest.SCOPE_SESSION);

		ModelAndView mav = new ModelAndView();
		for (MenuVo vo : menus.getMenus()) {
			int menuNo = menuDao.getSequence();
			vo.setNo(menuNo);
			vo.setStore(store.getNo());

			menuDao.addMenu(vo);

			if (!vo.getAttach()[0].isEmpty()) {
				for (MultipartFile file : vo.getAttach()) {
					MenuAttachVo avo = uploadService.execute(file, store.getNo());
					avo.setParent(menuNo);
					System.out.println(avo.toString());
					menuDao.addMenuAttach(avo);
				}
			}
		}
		System.out.println("3333");
		mav.setViewName("redirect:/owner/addedmenu");

		return mav;
	}

	// 오늘 주문 내역 전부 보여주는거
	@GetMapping("/today")
	public ModelAndView todayHandle01() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	// 현재 등록 되어 있는 메뉴들 전부다 보여주는거
	@GetMapping("/addedmenu")
	public ModelAndView addedMenuHandle02(WebRequest webRequest) {
		StoreVo vo = (StoreVo) webRequest.getAttribute("storeVo", WebRequest.SCOPE_SESSION);
		List<MenuVo> menuList = menuDao.getMenuList(vo.getNo());

		for (MenuVo vo22 : menuList) {
			System.out.println(vo22);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("owner/addedmenu");
		mav.addObject("storeVo", vo);
		mav.addObject("menuList", menuList);

		return mav;
	}

	// 메뉴수정페이지
	@GetMapping("/updatemenu")
	public ModelAndView updateMenu(@RequestParam("no") int no, WebRequest webRequest) {
		StoreVo svo = (StoreVo) webRequest.getAttribute("storeVo", WebRequest.SCOPE_SESSION);
		List<MenuVo> menuList = menuDao.getMenuList(svo.getNo());

		List<Map> menuType = menuDao.findAll();

		MenuVo vo = menuDao.getMenu(no);
		System.out.println("menu vo : " + vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("owner/updatemenu");
		mav.addObject("menu", vo);
		mav.addObject("menuTypeList", menuType);
		return mav;
	}

	// 메뉴수정페이지
	@PostMapping("/updatemenu")
	public ModelAndView updateMenu(@ModelAttribute MenuVo vo, @RequestParam("attach") MultipartFile[] files)
			throws Exception {

		System.out.println("menu vo : " + vo);
		menuDao.updateMenu(vo);

		if (!files[0].isEmpty()) {
			for (MultipartFile file : files) {
				MenuAttachVo avo = uploadService.execute(file, vo.getStore());

				avo.setParent(vo.getNo());
				avo.setNo(vo.getFileNo());
				System.out.println(avo.toString());
				menuDao.updateMenuAttach(avo);
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/owner/addedmenu");
		return mav;
	}

	// 메뉴통계
	@GetMapping("/menustats")
	public ModelAndView menuStatsHandle01(WebRequest webRequest) {
		StoreVo vo = (StoreVo) webRequest.getAttribute("storeVo", WebRequest.SCOPE_SESSION);
		// List<MenuVo> menuList = menuDao.getMenuList(vo.getNo());
		List<LogVo> lVo = orderDao.findStore(vo.getNo());
		System.out.println(lVo);
		// Map<Date, List<MenuVo>> salesMenu = new HashMap<>();
		Map<String, Integer> bestSales = new HashMap<>();

		for (int i = 0; i < lVo.size(); i++) {
			// salesMenu.put(lVo.get(i).getOrderDate(),lVo.get(i).getOrderList());
			System.out.println("lvo:" + lVo.get(i).getOrderList());
			if (lVo.get(i).getOrderList() == null) {
				continue;
			}
			for (int j = 0; j < lVo.get(i).getOrderList().size(); j++) {
				if (bestSales.containsKey(lVo.get(i).getOrderList().get(j).getName())) {
					System.out.println("cnt : " + bestSales.get(lVo.get(i).getOrderList().get(j).getName()));

					int cnt = bestSales.get(lVo.get(i).getOrderList().get(j).getName());
					cnt += lVo.get(i).getOrderList().get(j).getCnt();

					bestSales.put(lVo.get(i).getOrderList().get(j).getName(), cnt);
				} else {
					bestSales.put(lVo.get(i).getOrderList().get(j).getName(),
							lVo.get(i).getOrderList().get(j).getCnt());
				}
			}
		}

		System.out.println(bestSales);

		ModelAndView mav = new ModelAndView();

		List data = new ArrayList();
		List h = new ArrayList();
		h.add("menu");
		h.add("sales");
		data.add(h);
		Set<String> keys = bestSales.keySet();
		for (String key : keys) {
			List c = new ArrayList();
			c.add(key);
			c.add(bestSales.get(key));
			data.add(c);
		}

		String json = gson.toJson(data);
		mav.setViewName("owner/menustats");
		mav.addObject("data", json);

		System.out.println(data);

		return mav;
	}

	// 매출관련 통계
	@GetMapping("/salesstats")
	public ModelAndView salesStatsHandle01(WebRequest webRequest) {
		StoreVo vo = (StoreVo) webRequest.getAttribute("storeVo", WebRequest.SCOPE_SESSION);
		List<LogVo> lVo = orderDao.findStore(vo.getNo());
		System.out.println(lVo);
		Map<String, Integer> timeStates = new LinkedHashMap();

		int year = 2018;

		for (int i = 1; i <= 12; i++) {
			timeStates.put(i + "월", 0);
		}

		for (int i = 0; i < lVo.size(); i++) {

			Date date = lVo.get(i).getOrderdate();
			LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			int month = localDate.getMonthValue();

			if (localDate.getYear() == year) {
				switch (month) {
				case 1:
					timeStates.put("1월", timeStates.get("1월") + lVo.get(i).getTotalPrice());
					break;
				case 2:
					timeStates.put("2월", timeStates.get("2월") + lVo.get(i).getTotalPrice());
					break;
				case 3:
					timeStates.put("3월", timeStates.get("3월") + lVo.get(i).getTotalPrice());
					break;
				case 4:
					timeStates.put("4월", timeStates.get("4월") + lVo.get(i).getTotalPrice());
					break;
				case 5:
					timeStates.put("5월", timeStates.get("5월") + lVo.get(i).getTotalPrice());
					break;
				case 6:
					timeStates.put("6월", timeStates.get("6월") + lVo.get(i).getTotalPrice());
					break;
				case 7:
					timeStates.put("7월", timeStates.get("7월") + lVo.get(i).getTotalPrice());
					break;
				case 8:
					timeStates.put("8월", timeStates.get("8월") + lVo.get(i).getTotalPrice());
					break;
				case 9:
					timeStates.put("9월", timeStates.get("9월") + lVo.get(i).getTotalPrice());
					break;
				case 10:
					timeStates.put("10월", timeStates.get("10월") + lVo.get(i).getTotalPrice());
					break;
				case 11:
					timeStates.put("11월", timeStates.get("11월") + lVo.get(i).getTotalPrice());
					break;
				case 12:
					timeStates.put("12월", timeStates.get("12월") + lVo.get(i).getTotalPrice());
					break;
				}
			}
		}
		System.out.println("------" + timeStates);
		
		List list = new LinkedList();
		list.addAll(timeStates.values());

		List list2 = new LinkedList();
		list2.addAll(timeStates.keySet());

		String json = gson.toJson(list);
		String json2 = gson.toJson(list2);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("owner/salesstats");
		mav.addObject("price", json);
		mav.addObject("mounth", json2);
		System.out.println(json);
		System.out.println(json2);

		return mav;
	}
	// 리뷰관리창

	// 리뷰등록
	@RequestMapping("/review")
	public ModelAndView reviewHandle(WebRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("owner/review");

		StoreVo store = (StoreVo) req.getAttribute("storeVo", WebRequest.SCOPE_SESSION);

		List<ReviewVo> reviews = storeDao.findReview(store.getNo());
		System.out.println("[controller:owner] review : " + reviews);

		mav.addObject("reviews", reviews);
		return mav;
	}

	// 리뷰의 댓글등록
	@RequestMapping("/replied")
	public String repliedHandle(@RequestParam Map<String, String> map) {
		System.out.println("[controller:owner] replied : " + map);
		storeDao.updateReply(map);
		return "redirect:/owner/review";
	}
}
