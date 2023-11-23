package music.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import music.service.mypageService;

@Controller
public class MypageController {
	
	@Autowired
	private mypageService service;
	
//	@RequestMapping("home.do")
//	public String prList() {
//		return "home";
//	}
	
	@RequestMapping("mypage.do")
	public String prList() {
		return "/mypage/mypage";
	}
}