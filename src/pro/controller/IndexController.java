package pro.controller;

import java.io.IOException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class IndexController {
	@RequestMapping(value="/")
	public String index() throws IOException {
		// 뷰이름 이름, index.jsp 호출
		return "index";
	}
	
	@RequestMapping(value="/loginForm")
	public String LoginForm() throws IOException {
		{
			throw new IOException("occured IOException...");
		}
	}
}
