package pro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

import pro.dao.OrderDao;
import pro.vo.LogVo;
import pro.vo.MemberVo;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	OrderDao orderDao;
	
	@RequestMapping("/order")
	public String OrderHandle01() {
		return "order/order";
	}

	@RequestMapping("/random")
	public String randomHandle(WebRequest req) {
		MemberVo member = (MemberVo) req.getAttribute("vo", WebRequest.SCOPE_SESSION);
		List<LogVo> list = orderDao.findLog(member.getId());
		int num = 0;
		int[] set = new int[10];
		
		for(int i=1; i<11; i++) {
			for(LogVo l : list) {
				if(i == l.getType())
					continue;
				else
					set[i] = i;
			}
		}
		num = set[1 + (int)Math.random()*set.length];
		return "main?no="+num;
	}
}
