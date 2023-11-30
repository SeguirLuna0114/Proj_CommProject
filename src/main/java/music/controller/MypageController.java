package music.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import music.model.CommReplysVO;
import music.model.CommsVO;
import music.model.InfoAllVO;
import music.model.LikesListCommVO;
import music.model.LikesListPRVO;
import music.model.PagingJobManageVO;
import music.model.PrBoardVO;
import music.model.StatusAllVO;
import music.model.StatusFinalVO;
import music.model.StatusWaitingVO;
import music.model.jobBoardVO;
import music.service.mypageService;

@Controller
public class MypageController {
	
	// 서비스 인터페이스(마이페이지와 관련된 비즈니스 로직 처리)
	@Autowired
	private mypageService myService;
	// 세션에 데이터 저장하기 위해 사용
	private HttpSession session;
	
	@RequestMapping("home.do")
	public String homeList() {
		return "home";
	}

// 마이페이지 메인(지원/구인)
	// 지원 현황 마이페이지 메인으로 이동
	@RequestMapping("mypage_Apply.do")
	public String mypageApply(@RequestParam String id, Model model) {
		InfoAllVO infoAllDto = myService.viewMyPage(id);
		model.addAttribute("infoAllDto", infoAllDto);
		return "mypage/mypage/mypage_Apply";
	}
	
	// 구인 현황 마이페이지 메인으로 이동
	@RequestMapping("mypage_JobBoard.do")
	public String mypageJob(@RequestParam String id, Model model) {
//		public String mypageJob(@RequestParam String id, Model model, Integer page) {
		// 구인 현황 데이터 가져오기 위함
		InfoAllVO infoAllDto = myService.viewMyPage(id);
		model.addAttribute("infoAllDto", infoAllDto);

		// 모든 Job데이터
		List<jobBoardVO> allJobDatas = myService.viewAllJobDatas();
		model.addAttribute("allJobDatas", allJobDatas);
		
		// 작성한 모든 구인공고 리스트
		List<jobBoardVO> jobLists = myService.viewMyBoard(id);
		model.addAttribute("jobLists", jobLists);

		// 페이징 처리
//		PagingJobManageVO pagingJobManageVO = myService.pagingViewBoard(id, page);
//		model.addAttribute("pagingJobManageVO", pagingJobManageVO);

		return "mypage/mypage/mypage_JobBoard";
	}	
	
	
// 지원 페이지 관련
	// 모든 진행상태
	@RequestMapping("applyStatusAll.do")
	public String appStatsAll(@RequestParam String id, Model model, String keyword) {
		StatusAllVO statusAllVO = myService.viewAppAll(id, keyword);
		model.addAttribute("statusAllVO", statusAllVO);
		
		// keyword를 세션에 저장 -> 다음 페이지에서 활용
		Map<String, Object> referer = new HashMap<String, Object>();
		referer.put("keyword", statusAllVO.getKeyword());
		session.setAttribute("referer", referer);
		
		return "mypage/job/applyStatusAll";
	}
	
	// 진행상태 = 대기중
	@RequestMapping("applyStatus.do")
	public String appStats(@RequestParam String id, Model model, String keyword) {
		StatusWaitingVO statusWaitingVO = myService.viewAppWait(id, keyword);
		model.addAttribute("statusWaitingVO", statusWaitingVO);
		
		// keyword를 세션에 저장 -> 다음 페이지에서 활용
		Map<String, Object> referer = new HashMap<String, Object>();
		referer.put("keyword", statusWaitingVO.getKeyword());
		session.setAttribute("referer", referer);
		
		return "mypage/job/applyStatus";
	}
	
	// 진행상태 = 승인
	@RequestMapping("applyStatusFin.do")
	public String appStatsFin(@RequestParam String id, Model model, String keyword) {
		StatusFinalVO statusFinalVO = myService.viewAppFin(id, keyword);
		model.addAttribute("statusFinalVO", statusFinalVO);
		
		// keyword를 세션에 저장 -> 다음 페이지에서 활용
		Map<String, Object> referer = new HashMap<String, Object>();
		referer.put("keyword", statusFinalVO.getKeyword());
		session.setAttribute("referer", referer);		
		
		return "mypage/job/applyStatusFin";
	}
	
	
	
//	좋아요 관련
	// 커뮤니티 좋아요 한 글 리스트
	@RequestMapping("likeListsComm.do")
	public String likeListsComm(@RequestParam String id, Model model) {
		List<LikesListCommVO> likesListComm = myService.viewLikeListComm(id);
		model.addAttribute("likesListComm", likesListComm);
		
		return "mypage/like/likeListsComm";
	}
	
	
	// 좋아요 설정한 PR글 리스트
	@RequestMapping("likeListsPR.do")
	public String likeListsPR(@RequestParam String id, Model model) {
//		public String likeListsPR(@RequestParam String id, Model model, Integer page) {
		List<LikesListPRVO> likesListPR = myService.viewLikeListPR(id);
		model.addAttribute("likesListPR", likesListPR);
		
		// 모든 PR데이터
		List<PrBoardVO> allPrDatas = myService.viewAllPrDatas();
		model.addAttribute("allPrDatas", allPrDatas);
		
		// 페이징 처리
//		PagingJobManageVO pagingJobManageVO = myService.pagingViewBoard(id, page);
//		model.addAttribute("pagingJobManageVO", pagingJobManageVO);
		
		return "mypage/like/likeListsPR";
	}
	
// 커뮤니티 글 관리
	// 작성한 커뮤니티 글 리스트
	@RequestMapping("commWroteAll.do")
	public String commLists(@RequestParam String id, Model model, String keyword) {
		CommsVO commsVO = myService.viewCommLists(id, keyword);
		model.addAttribute("commsVO", commsVO);
		
		// keyword를 세션에 저장 -> 다음 페이지에서 활용
		Map<String, Object> referer = new HashMap<String, Object>();
		referer.put("keyword", commsVO.getKeword());
		session.setAttribute("referer", referer);
		
		return "mypage/comm/commWroteAll";
	}
	
	// 작성한 커뮤니티 댓글 리스트
	@RequestMapping("commReplyWrote.do")
	public String commReplyLists(@RequestParam String id, Model model, String keyword) {
		CommReplysVO commReplysVO = myService.viewCommReplyLists(id, keyword);
		model.addAttribute("commReplysVO", commReplysVO);
		
		// keyword를 세션에 저장 -> 다음 페이지에서 활용
		Map<String, Object> referer = new HashMap<String, Object>();
		referer.put("keyword", commReplysVO.getKeword());
		session.setAttribute("referer", referer);
		
		return "mypage/comm/commReplyWrote";
	}
	
	
}
