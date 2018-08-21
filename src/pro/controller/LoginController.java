package pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pro.dao.MemberDao;
import pro.vo.MemberVo;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	MemberDao memberDao;

	@GetMapping({"/loginForm"})
	public String LoginFormGetHandle() {
		return "loginForm";
	}
	
	@PostMapping("/loginForm")
	public ModelAndView LoginFormPostHandle(@RequestParam("id") String id, @RequestParam("password") String password) { //id랑 password를 입력해서 넘겨줌
		ModelAndView mav = new ModelAndView();
		
		//로그인 처리 : 아이디가 있는지 보고, 비밀번호가 맞는지 보고
		//db : sql문 : select * from member where id=#{id} -> 반환타입: vo
		MemberVo vo = memberDao.findById(id);
		
		//.equals(password) 맞으면(if-else) 어디로 보내야겠죠(index) 틀리면 다시하라고 보내야함 
		/*
		if() { //session에다가 vo를 올려주세요.
			mav.setViewName("index");
		} else {
			mav.setViewName("login/loginForm");
		}
		*/
		return mav;
	}
	
}
