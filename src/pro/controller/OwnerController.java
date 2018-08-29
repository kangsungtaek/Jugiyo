package pro.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import pro.dao.MenuDao;
import pro.dao.OrderDao;
import pro.dao.StoreDao;
import pro.service.UploadService;
import pro.vo.LogVo;
import pro.vo.MenuAttachVo;
import pro.vo.MenuVo;
import pro.vo.MultiMenuVo;
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

	// 사장님 페이지
	@GetMapping("/index")
	public String indexHandle01(WebRequest webRequest) {
		webRequest.getAttribute("login", WebRequest.SCOPE_SESSION);
		return "owner/index";
	}

	// 메뉴추가 컨트롤러 만드는중
	@GetMapping("/addmenu")
	public String addMenuHandle01() {
		return "owner/addmenu";
	}

	// @RequestParam("file")MultipartFile[] files

	@PostMapping("/addmenu")
	public ModelAndView indexHandle02(@ModelAttribute MultiMenuVo menus, WebRequest webRequest) throws Exception {
		StoreVo store = (StoreVo) webRequest.getAttribute("login", WebRequest.SCOPE_SESSION);
		ModelAndView mav = new ModelAndView();
		for (MenuVo vo : menus.getMenus()) {
			int menuNo = menuDao.getSequence();
			vo.setNo(menuNo);
			vo.setStore(store.getNo());
			System.out.println(menuNo);
			System.out.println(vo.toString());
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

		mav.setViewName("owner/addedmenu");

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
		StoreVo vo = (StoreVo) webRequest.getAttribute("login", WebRequest.SCOPE_SESSION);
		List<MenuVo> menuList = menuDao.getMenuList(vo.getNo());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("owner/addedmenu");
		mav.addObject("storeVo", vo);
		mav.addObject("menuList", menuList);

		return mav;
	}

	// 메뉴수정페이지
	@GetMapping("/updatemenu")
	public ModelAndView updateMenu(@RequestParam("no") int no, WebRequest webRequest) {
		StoreVo vo = (StoreVo) webRequest.getAttribute("login", WebRequest.SCOPE_SESSION);
		List<MenuVo> menuList = menuDao.getMenuList(vo.getNo());

		ModelAndView mav = new ModelAndView();

		return mav;
	}

	// 메뉴통계
	@GetMapping("/menustats")
	public ModelAndView menuStatsHandle01(WebRequest webRequest) {
		StoreVo vo = (StoreVo) webRequest.getAttribute("login", WebRequest.SCOPE_SESSION);
		// List<MenuVo> menuList = menuDao.getMenuList(vo.getNo());
		List<LogVo> lVo = orderDao.findStore(vo.getNo());
		System.out.println(lVo);
		// Map<Date, List<MenuVo>> salesMenu = new HashMap<>();
		Map<Integer, Integer> bestSales = new HashMap<>();

		for (int i = 0; i < lVo.size(); i++) {
			// salesMenu.put(lVo.get(i).getOrderDate(),lVo.get(i).getOrderList());
			System.out.println( lVo.get(i).getOrderList());
			if( lVo.get(i).getOrderList() == null) {
				continue;
			}
			for (int j = 0; j < lVo.get(i).getOrderList().size(); j++) {
				
				bestSales.put(lVo.get(i).getOrderList().get(j).getNo(), lVo.get(i).getOrderList().get(j).getCnt());

				 if (bestSales.containsKey(lVo.get(i).getOrderList().get(j).getNo())) {
					 int sum = bestSales.get(lVo.get(i).getOrderList().get(j).getNo())+ lVo.get(i).getOrderList().get(j).getCnt();
					 bestSales.put(lVo.get(i).getOrderList().get(j).getNo(), sum);
				 }
			}
		}

		for (Integer i1 : bestSales.keySet()) {
			System.out.println("key:" + i1 + ", value" + bestSales.get(i1));
		}

		ModelAndView mav = new ModelAndView();
		return mav;
	}

	// 매출관련 통계
	@GetMapping("/salesstats")
	public ModelAndView salesStatsHandle01() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
