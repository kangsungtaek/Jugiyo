package pro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import pro.dao.MenuDao;
import pro.service.UploadService;
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
	
	
	//사장님 페이지
	@GetMapping("/index")
	public String indexHandle01(WebRequest webRequest) {
		webRequest.getAttribute("login",WebRequest.SCOPE_SESSION);
		return "owner/index";
	}
	
	//메뉴추가 컨트롤러 만드는중
	@GetMapping("/addmenu")
	public String addMenuHandle01() {
		return "owner/addmenu";
	}
	
//	@RequestParam("file")MultipartFile[] files
	
	@PostMapping("/addmenu")
	public ModelAndView indexHandle02(@ModelAttribute MultiMenuVo menus, WebRequest webRequest) throws Exception {
		StoreVo store = (StoreVo)webRequest.getAttribute("login", WebRequest.SCOPE_SESSION);
		int menuNo=menuDao.getSequence();
		ModelAndView mav = new ModelAndView();
		for(MenuVo vo : menus.getMenus()) {
			System.out.println(vo);
		}
		
		/*
		vo.setNo(menuNo);
		vo.setStore(store.getNo());
		menuDao.addMenu(vo);
		System.out.println(vo.toString());

		
		
		int cnt=0;
		if(!files[0].isEmpty()) {
			for(MultipartFile file : files) {
				MenuAttachVo avo= uploadService.execute(file,store.getNo());
				avo.setParent(menuNo);
				menuDao.addMenuAttach(avo);
				cnt++;
			}
		}
		mav.setViewName("owner/addedmenu");
		*/
		

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
	public ModelAndView addedMenuHandle01(WebRequest webRequest) {
		StoreVo store = (StoreVo)webRequest.getAttribute("login", WebRequest.SCOPE_SESSION);
		List<MenuVo> menuList = menuDao.getMenuList(store.getNo());
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	@PostMapping("/addedmenu")
	public ModelAndView addedMenuHandle02() {
		ModelAndView mav = new ModelAndView();
		
		
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
}

