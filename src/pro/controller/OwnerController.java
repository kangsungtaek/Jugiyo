package pro.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import pro.dao.MenuDao;
import pro.dao.StoreDao;
import pro.service.UploadService;
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
	
	
	//사장님 페이지
	@GetMapping("/index")
	public String indexHandle01(WebRequest webRequest) {
		webRequest.getAttribute("login",WebRequest.SCOPE_SESSION);
		return "owner/index";
	}
	
	//메뉴추가 컨트롤러 만드는중
	@GetMapping("/addmenu")
	public ModelAndView addMenuHandle01() {
		
		ModelAndView mav = new ModelAndView();
		List<Map> menuType = menuDao.findAll();
		System.out.println("menuType" + menuType);
		mav.setViewName("owner/addmenu");
		mav.addObject("menuTypeList", menuType);
		
		return mav;
	}
	
//	@RequestParam("file")MultipartFile[] files
	
	@PostMapping("/addmenu")
	public ModelAndView indexHandle02(@ModelAttribute MultiMenuVo menus, WebRequest webRequest) throws Exception {
		StoreVo store = (StoreVo)webRequest.getAttribute("vo", WebRequest.SCOPE_SESSION);
		
		ModelAndView mav = new ModelAndView();
		for(MenuVo vo : menus.getMenus()) {
			int menuNo=menuDao.getSequence();
			vo.setNo(menuNo);
			vo.setStore(store.getNo());
			
			menuDao.addMenu(vo);
			
			if(!vo.getAttach()[0].isEmpty()) {
				for(MultipartFile file : vo.getAttach()) {
					MenuAttachVo avo= uploadService.execute(file,store.getNo());
					avo.setParent(menuNo);
					System.out.println(avo.toString());
					menuDao.addMenuAttach(avo);
				}
			}
		}

		mav.setViewName("owner/addedmenu");
		
		

		return mav;
	}
	//오늘 주문 내역 전부 보여주는거
	@GetMapping("/today")
	public ModelAndView todayHandle01() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	//현재 등록 되어 있는 메뉴들 전부다 보여주는거
	@GetMapping("/addedmenu")
	public ModelAndView addedMenuHandle02(WebRequest webRequest) {
		StoreVo vo = (StoreVo)webRequest.getAttribute("vo", WebRequest.SCOPE_SESSION);
		List<MenuVo> menuList = menuDao.getMenuList(vo.getNo());
		
		for(MenuVo vo22 : menuList) {
			System.out.println(vo22);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("owner/addedmenu");
		mav.addObject("storeVo", vo);
		mav.addObject("menuList", menuList);
		
		
		return mav;
	}
	
	//메뉴통계
	@GetMapping("/menustats")
	public ModelAndView menuStatsHandle01() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	//매출관련 통계
	@GetMapping("/salesstats")
	public ModelAndView salesStatsHandle01() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	//리뷰등록
	@RequestMapping("/review")
	public ModelAndView reviewHandle(WebRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("owner/review");
		
		StoreVo store = (StoreVo) req.getAttribute("vo", WebRequest.SCOPE_SESSION);
		List<ReviewVo> reviews = storeDao.findReview(store.getNo());
		
		mav.addObject("reviews", reviews);
		return mav;
	}
}

