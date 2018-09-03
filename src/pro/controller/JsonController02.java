package pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;


import pro.dao.OrderDao;
@Controller
public class JsonController02 {
	@Autowired
	OrderDao orderDao;

	@RequestMapping(value = "/Json", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView JsonController2(@RequestParam String objId, String mode, WebRequest webRequest) {
		ModelAndView mav = null;
		switch (mode) {
		case "updateDelivery":
			mav = updateDelivery(objId, webRequest);
			
			System.out.println("delivery Update");
		}
		
		return mav;
	}

	private ModelAndView updateDelivery(String objId, WebRequest webRequest) {
		ModelAndView mav = new ModelAndView();
		orderDao.updateDelivery(objId);
		return mav;
	}

}
