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
	
	// 마이페이지 메인으로 이동
	@RequestMapping("mypage.do")
	public String mypageMain() {
		return "/mypage/mypage";
	}

	// 지원완료 페이지로 이동(모든 진행상태)
	@RequestMapping("applyStatusAll.do")
	public String mypage_appAll() {
		return "/mypage/applyStatusAll";
	}
	
	// 지원완료 페이지로 이동(진행상태 = 대기중)
	@RequestMapping("applyStatus.do")
	public String mypage_appl() {
		return "/mypage/applyStatus";
	}
	
	// 지원완료 페이지로 이동(진행상태 = 합격)
	@RequestMapping("applyStatusFin.do")
	public String mypage_appfin() {
		return "/mypage/applyStatusFin";
	}
}


//@GetMapping("/mypage/{id}")
//public String getMyPage(@PathVariable Integer id, Model model) {
//    InfoAllDto infoAllDto = myPageService.viewMyPage(id);
//    model.addAttribute("infoAllDto", infoAllDto);
//    return "mypage/myPage";
//}
