package pro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import pro.dao.MemberDao;
import pro.vo.LogVo;
import pro.vo.MemberVo;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	MemberDao memberDao;

	@RequestMapping("/memInfo")
	public String memInfoHandle() {
		return "login/memInfo";
	}
	
	//주문내역 불러오기
	@RequestMapping("/history")
	public ModelAndView historyHandle(WebRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/history");
		
		MemberVo member = (MemberVo)req.getAttribute("vo", WebRequest.SCOPE_SESSION);
		
		List<LogVo> list = memberDao.readAllById(member.getId());
		mav.addObject("list", list);
		
		return mav;
	}
}
