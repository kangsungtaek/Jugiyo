package pro.controller;

import java.nio.channels.WritableByteChannel;
import java.util.HashMap;
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
import pro.vo.LogVo;
import pro.vo.MemberVo;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberDao memberDao;

	@RequestMapping("/memInfo")
	public String memInfoHandle() {
		return "member/memInfo";
	}
	
	//주문내역 불러오기
	@RequestMapping("/history")
	public ModelAndView historyHandle(WebRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/history");
		
		MemberVo member = (MemberVo)req.getAttribute("vo", WebRequest.SCOPE_SESSION);
		
		List<LogVo> list = memberDao.readAllById(member.getId());
		System.out.println("[controller:member] history : " + list);
		mav.addObject("list", list);
		
		return mav;
	}
	
	@GetMapping("/writeReview")
	public ModelAndView writeGetReviewHandle(@RequestParam("no") int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("no", no);
		mav.setViewName("member/writeReview");
		return mav;
	}
	
	@PostMapping("/writeReview")
	public ModelAndView writeReviewPostHandle(@RequestParam Map<String, Object> map, WebRequest req) {
		ModelAndView mav = new ModelAndView();
		System.out.println("[controller:member] review : " + map);
		mav.setViewName("member/memInfo");
		MemberVo vo = (MemberVo) req.getAttribute("vo", WebRequest.SCOPE_SESSION);
		map.put("nickname", vo.getNickname());
		
		memberDao.addReview(map);
		return mav;
	}
	
	@RequestMapping("/addAddr")
	public void addAddrHandle(@RequestParam("addr") String addr, WebRequest req) {
		MemberVo member = (MemberVo) req.getAttribute("vo", WebRequest.SCOPE_SESSION);
		Map<String, String> map = new HashMap<>();
			map.put("id", member.getId());
			map.put("addr", addr);
		memberDao.addAddr(map);
	}
}
