package pro.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import pro.dao.MenuDao;
import pro.vo.MenuVo;

@Controller
public class JsonController {

	@Autowired
	MenuDao menuDao;

	@Autowired
	Gson gson;

	/*
	 * 사용자가 메뉴 클릭시(ajax send) 세션에 menuList 에 사용자가 눌른 메뉴 add ( menuList가 없다면 생성) 눌른
	 * 메뉴 다시 보내줌.
	 */
	@RequestMapping(value = "/sendJson", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView JsonController(@RequestParam int no, WebRequest webRequest) {
		
		ModelAndView mav = new ModelAndView();
		ArrayList<MenuVo> menuList = (ArrayList<MenuVo>) webRequest.getAttribute("orderList", WebRequest.SCOPE_SESSION);

		if (menuList == null) {
			menuList = new ArrayList<MenuVo>();
		}

		boolean overLapCheck = false;

		for (MenuVo mVo : menuList) {
			if (mVo.getNo() == no) {
				overLapCheck = true;
				mVo.setCnt(mVo.getCnt() + 1);
			}
		}
		Map map = new HashMap<>();
		if (overLapCheck) {
			map.put("overLap", true);
			map.put("menu", no);
			
		} else {
			map.put("overLap", false);
			MenuVo vo = menuDao.getMenu(no);
			vo.setCnt(1);
			menuList.add(vo);
			map.put("menu", vo);
			
		}

		webRequest.setAttribute("orderList", menuList, WebRequest.SCOPE_SESSION);
		String aa = gson.toJson(map);
		mav.addObject("json", aa);
		mav.setViewName("sendJson");

		return mav;
	}
}
