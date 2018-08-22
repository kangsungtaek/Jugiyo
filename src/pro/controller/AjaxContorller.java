package pro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import pro.dao.MemberDao;
import pro.vo.MemberVo;

@Controller
@RequestMapping("/ajax")
public class AjaxContorller {
	@Autowired
	Gson gson;
	
	@Autowired
	MemberDao memberDao;
	
	//아이디 중복체크
	@RequestMapping(value="/login/regForm", produces="application/json;charset=UTF-8")
	@ResponseBody	
	public String regFormAjaxHandle(@RequestParam String id) {
	//	System.out.println("param : " + id);
//		List<MemberVo> list=memberDao.findStartWith(id+"%");
		
		List<String> list = memberDao.findAll();
		//select id from member;
		
		String j = null;
		//list에 없으면 가입하라는 문자, 있으면 이미 있다는 경고메세지
		for(String s : list) {
			//list에 있는 각각의 아이템들이 s라는 이름으로 나타나요.
			if(id.equals(s)) { 
				j = "1";
				break;
			} else {
				j = "-1";
			}
		}
		
		String json = gson.toJson(j);
	//	System.out.println(json);
		return json;
	}
}









