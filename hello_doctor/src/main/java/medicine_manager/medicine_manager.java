package medicine_manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("manager")
public class medicine_manager {
	
	@RequestMapping("/")
	public String home() {
		String url = "manager/medicine_manager";
		return url;
	}
	
}
