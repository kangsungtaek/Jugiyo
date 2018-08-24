package pro.controller;

import java.util.List;

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
import pro.vo.MenuVo;



@Controller
@RequestMapping("/owner")
public class OwnerController {
	@Autowired
	MenuDao addMenuDao;
	
	
	
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
	public ModelAndView indexHandle02(@ModelAttribute MenuVo vo,WebRequest webRequest) {
		System.out.println(vo.toString());
		
//		for(AddMenuVo vo1 : vo) {
//			System.out.println(vo1.toString());
//		}
		
//		int cnt=0;
//		if(!files[0].isEmpty()) {
//			for(MultipartFile file : files) {
//				AddMenuVo avo= uploadService.execute(file, store);
//				addMenuDao.addMenu(avo);
//				cnt++;
//			}
//		}
//		
//		
//		StoreVo storeVo=(StoreVo)webRequest.getAttribute("storeVo", WebRequest.SCOPE_SESSION);
//		vo.setName(storeVo.getName());
//		
		ModelAndView mav = new ModelAndView();
//		boolean r = addMenuDao.addMenu(vo);
//		if(r) {
//			mav.setViewName("owner/addmenu");
//			mav.addObject("success",r);
//		}
		return mav;
	}
}

