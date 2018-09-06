package pro.service;

import org.springframework.format.datetime.DateFormatter;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;

@ControllerAdvice("/*")
public class DateService {
	
	@InitBinder
	public void bind(WebDataBinder binder) {
		System.out.println("[DateService] DateFormat binding");
		binder.addCustomFormatter(new DateFormatter("yyyy-MM-dd"));
	}
}
