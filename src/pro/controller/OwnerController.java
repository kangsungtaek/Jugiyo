package pro.controller;

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
import pro.service.UploadService;
import pro.vo.MenuVo;



@Controller
@RequestMapping("/owner")
public class OwnerController {
	@Autowired
	MenuDao menuDao;
	@Autowired
	UploadService uploadService;
	
	
	//사장님 페이지
	@GetMapping("/index")
	public String indexHandle01() {
		return "owner/index";
	}
	
	//메뉴추가 컨트롤러 만드는중
	@GetMapping("/addmenu")
	public String addMenuHandle01() {
		return "owner/addmenu";
	}
	
//	@RequestParam("file")MultipartFile[] files
	
	@PostMapping("/addmenu")
	public ModelAndView indexHandle02(@ModelAttribute MenuVo [] vo, WebRequest webRequest, @RequestParam("attach") MultipartFile[] files) {
		System.out.println(vo.toString());
//		String store = "";
		ModelAndView mav = new ModelAndView();
		
		int cnt=0;
		if(!files[0].isEmpty()) {
			for(MultipartFile file : files) {
//				MenuVo avo= uploadService.execute(file, store);
//				menuDao.addMenu(avo);
				cnt++;
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
	public ModelAndView addedMenuHandle01() {
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

