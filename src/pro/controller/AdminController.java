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

import pro.dao.StoreDao;
import pro.dao.TypeDao;
import pro.service.UploadService;
import pro.vo.StoreVo;
import pro.vo.TypeVo;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	StoreDao storeDao;
	
	@Autowired
	TypeDao typeDao;
	
	@Autowired
	UploadService uploadService;
	
	//상점등록 페이지
	@GetMapping("/addStore")
	public ModelAndView storeGetHandle() {
		System.out.println("[controller] addStore");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/addStore");
		
		//업종불러와서 select태그에 사용할 수 있도록
		List<TypeVo> types = typeDao.getAll();
		//type이라는 테이블이 있어요-상점의 타입을 등록해놓은 테이블-> 전체를 불러와서
		mav.addObject("types", types); //types라는 이름으로 저장을 해놓음
		
		return mav;
	}
	
	//상점등록 처리페이지
	@PostMapping("/addStore")
	public ModelAndView storePostHandle(@ModelAttribute StoreVo vo, WebRequest req ,@RequestParam("attach") MultipartFile[] files) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("[controller:addStore]" + vo.toString());
		
		int seq = storeDao.getSeq();
		System.out.println( "sotreNo (seq) : " + seq);
		vo.setNo(seq);
		String id = "st" + seq;
		vo.setId(id);
		vo.setPassword("1111");
		
		if (!files[0].isEmpty()) {
			for (MultipartFile file : files) {
				String imgUrl = uploadService.execute2(file, vo.getNo());
				vo.setImg(imgUrl);
			}
		}
		
		System.out.println("[controller:addStore] db insert : " + vo.toString());
		
		//상점insert작업
		boolean b = storeDao.insertStore(vo);
		
		mav.setViewName("admin/added");
		mav.addObject("vo", vo);
		req.setAttribute("cer", b, WebRequest.SCOPE_REQUEST);
		return mav;
	}
	
}
