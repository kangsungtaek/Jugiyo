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

import pro.dao.StoreDao;
import pro.dao.TypeDao;
import pro.vo.StoreVo;
import pro.vo.TypeVo;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	StoreDao storeDao;
	
	@Autowired
	TypeDao typeDao;
	
	//상점등록 페이지
	@GetMapping("/addStore")
	public ModelAndView storeGetHandle() {
		System.out.println("[controller] addStore");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/addStore");
		
		//업종불러와서 select태그에 사용할 수 있도록
		List<TypeVo> types = typeDao.getAll();
		mav.addObject("types", types);
		
		return mav;
	}
	
	//상점등록 처리페이지
	@PostMapping("/addStore")
	public ModelAndView storePostHandle(@ModelAttribute StoreVo vo, WebRequest req) {
		System.out.println("[controller:addStore]" + vo.toString());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/added");
		
		int seq = storeDao.getSeq();
		vo.setNo(seq);
		String id = "st" + seq;
		vo.setId(id);
		vo.setPassword("1111");
		System.out.println("[controller:addStore] db insert : " + vo.toString());
		
		//상점insert작업
		boolean b = storeDao.insertStore(vo);
		
		mav.addObject("vo", vo);
		req.setAttribute("cer", b, WebRequest.SCOPE_REQUEST);
		return mav;
	}
}
