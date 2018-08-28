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
	public ModelAndView JsonController(@RequestParam int no, String mode, WebRequest webRequest) {
		ModelAndView mav = null;
		
		ArrayList<MenuVo> menuList = (ArrayList<MenuVo>) webRequest.getAttribute("orderList", WebRequest.SCOPE_SESSION);

		if (menuList == null) {
			menuList = new ArrayList<MenuVo>();
		}
		
		switch(mode) {
		case "add":
			mav = menuAdd(menuList,no,webRequest);
			System.out.println("menu add");
			break;
		case "remove":
			mav = menuRemove(menuList,no,webRequest);
			System.out.println("menu remove");
			break;
		case "plus":
			mav = menuPlus(menuList,no,webRequest);
			System.out.println("menu plus");
			break;
		case "minus":
			mav = menuMinus(menuList,no,webRequest);
			System.out.println("menu minus");
			break;
		case "menuDelete":
			mav = menuDelete(no , webRequest);
			System.out.println("menu delete");
		}
		
		mav.setViewName("sendJson");

		return mav;
	}
	
	private ModelAndView menuDelete(int no, WebRequest webRequest) {
		ModelAndView mav = new ModelAndView();
		boolean result = menuDao.deleteMenu(no);
		Map m = new HashMap();
		m.put("rst", result);
		
		String del=gson.toJson(m);
		mav.addObject("json", del);
		return mav;
	}

	private ModelAndView menuMinus(ArrayList<MenuVo> menuList, int no, WebRequest webRequest) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<>();
		boolean result = false;
		int price = 0;
		for (MenuVo mVo : menuList) {
			if (mVo.getNo() == no) {
				if(mVo.getCnt() >= 2) {
					mVo.setCnt(mVo.getCnt() - 1);
					price = mVo.getCnt() * mVo.getPrice();
					map.put("menu", mVo);
					result =true;
					break;
				}
			}
		}
		
		webRequest.setAttribute("orderList", menuList, WebRequest.SCOPE_SESSION);
		
		
		map.put("result", result);
		map.put("price", price);
		String aa = gson.toJson(map);
		mav.addObject("json", aa);
		
		
		return mav;
	}

	private ModelAndView menuPlus(ArrayList<MenuVo> menuList, int no, WebRequest webRequest) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<>();
		boolean result = false;
		int price = 0;
		for (MenuVo mVo : menuList) {
			if (mVo.getNo() == no) {
				mVo.setCnt(mVo.getCnt() + 1);
				price = mVo.getCnt() * mVo.getPrice();
				map.put("menu", mVo);
				result =true;
				break;
			}
		}
		
		webRequest.setAttribute("orderList", menuList, WebRequest.SCOPE_SESSION);
		
	
		map.put("result", result);
		map.put("price", price);
		String aa = gson.toJson(map);
		mav.addObject("json", aa);
		
		return mav;
	}

	private ModelAndView menuRemove(ArrayList<MenuVo> menuList, int no, WebRequest webRequest) {
		Map<String, Object> map = new HashMap<>();
		ModelAndView mav = new ModelAndView();
		boolean result = false;
		for(MenuVo mVo : menuList) {
			if( mVo.getNo() == no) {
				menuList.remove(mVo);
				result =true;
				break;
			}
		}
		
		webRequest.setAttribute("orderList", menuList, WebRequest.SCOPE_SESSION);
		
		
		map.put("result", result);
		String aa = gson.toJson(map);
		mav.addObject("json", aa);
		
		
		return mav;
		
	}

	private ModelAndView menuAdd(ArrayList<MenuVo> menuList, int no, WebRequest webRequest) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<>();
		boolean overLapCheck = false;
		int price = 0;
		for (MenuVo mVo : menuList) {
			if (mVo.getNo() == no) {
				overLapCheck = true;
				mVo.setCnt(mVo.getCnt() + 1);
				price = mVo.getCnt() * mVo.getPrice();
				map.put("price", price);
				map.put("menu", mVo);
			}
		}
	
		if (overLapCheck) {
			map.put("overLap", true);
			
			
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
		
		return mav;
		
		
	}

}
