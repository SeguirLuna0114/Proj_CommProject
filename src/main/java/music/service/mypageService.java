package music.service;

import java.util.List;

import music.model.CommReplysVO;
import music.model.CommsVO;
import music.model.InfoAllVO;
import music.model.KeywordVO;
import music.model.LikesListCommVO;
import music.model.LikesListPRVO;
import music.model.PagingJobManageVO;
import music.model.PagingVO;
import music.model.PrBoardVO;
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
	// 모든 유저가 작성한 구인공고 데이터 가져옴
	public List<jobBoardVO> viewAllJobDatas();
	// 구인공고 가져오는 페이징 처리
	public PagingJobManageVO pagingViewBoard(KeywordVO keywordVO, String id);

// 페이지 처리
	public PagingVO paging(KeywordVO keywordVO, String id);


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
	// PR게시판에 모든 유저들이 작성한 항목 데이터 리스트
	public List<PrBoardVO> viewAllPrDatas();
	
	
// 커뮤니티 작성 글 관리
	// 작성한 커뮤니티 글 리스트
	public CommsVO viewCommLists(String id, String keyword);
	// 커뮤니티 댓글 리스트
	public CommReplysVO viewCommReplyLists(String id, String keyword);

// 삭제 관련
	// 작성한 커뮤니티 글 삭제
	public int deleteMyComms(String[] delCommNoArr);
	// 작성한 커뮤니티 댓글 삭제
	public int deleteMyComReplys(String[] delCommReNoArr);
	
}
