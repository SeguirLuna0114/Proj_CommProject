package music.service;

import java.util.List;

import music.model.CommInfoVO;
import music.model.CommReplysVO;
import music.model.CommsVO;
import music.model.InfoAllVO;
import music.model.LikesListCommVO;
import music.model.LikesListPRVO;
import music.model.StatusAllVO;
import music.model.StatusFinalVO;
import music.model.StatusWaitingVO;
import music.model.jobBoardVO;

// 서비스 인터페이스 설계
public interface mypageService {
	
	// 유저 관련 모든 정보 가져오는 메소드
	public InfoAllVO viewMyPage(String id);

	// 유저가 작성한 구인공고 정보 가져오는 메소드
	public List<jobBoardVO> viewMyBoard(String id);

// 지원 현황 리스트 페이지(applyStatus)
	// 현재 전체 지원 현황
	public StatusAllVO viewAppAll(String id, String keyword);
	// 현재 지원 후 대기 현황
	public StatusWaitingVO viewAppWait(String id, String keyword);
	// 지원 완료(승인) 현황
	public StatusFinalVO viewAppFin(String id, String keyword);

// 좋아요 현황 페이지
	// 커뮤니티 좋아요 한 글 리스트
	public List<LikesListCommVO> viewLikeListComm(String id);
	// 좋아요 한 PR글 리스트
	public List<LikesListPRVO> viewLikeListPR(String id);

// 커뮤니티 작성 글 관리
	// 작성한 커뮤니티 글 리스트
	public CommsVO viewCommLists(String id, String keyword);
	// 커뮤니티 댓글 리스트
	public CommReplysVO viewCommReplyLists(String id, String keyword);
	
}
