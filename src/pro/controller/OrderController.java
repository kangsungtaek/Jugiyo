package pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@RequestMapping("/order")
	public String OrderHandle01() {
		return "order/order";
	}

	@RequestMapping("/random")
	public String randomHandle() {
		
		return null;
	}
}
