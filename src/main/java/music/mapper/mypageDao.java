package music.mapper;

import java.util.List;

// Mapper클래스 사용
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import music.model.CommInfoVO;
import music.model.CommReplyInfoVO;
import music.model.InfoCountVO;
import music.model.JobInfoVO;
import music.model.LikesListCommVO;
import music.model.LikesListPRVO;
import music.model.StatusCountVO;
import music.model.StatusFinalInfoVO;
import music.model.StatusInfoVO;
import music.model.StatusWaitingInfoVO;
import music.model.UserInfoVO;
import music.model.jobBoardVO;

// Mapper 인터페이스 작성
@Mapper
public interface mypageDao {

	// 유저 정보(이름, 이메일...) 출력을 위함
	public List<UserInfoVO> findUser(@Param("id") String id);
	
	// 유저 관련 횟수(count) 출력 위함
	public List<InfoCountVO> findInfoCounts(@Param("id") String id);
	
	// 공고 추천하기 위함
	public List<JobInfoVO> findrecJob(@Param("id") String id);
	
	// 지원현황 관련 횟수
	public List<StatusCountVO> findCounts(@Param("id") String id);
	
	
	
// 	구인 게시판 관련
	// 유저가 구인페이지에 작성한 내용을 가져옴
	public List<jobBoardVO> findAllBoards(@Param("id") String id); 	// 모든 구인 게시판 내용을 가져옴
    
    
// 구인 현황 상세페이지
	// 전체, 현재 진행중(상태=대기), 최종 승인(상태=승인)
	public List<StatusInfoVO> findAllStat(@Param("id") String id, @Param("keyword") String keyword);
	public List<StatusWaitingInfoVO> findWaitingStat(@Param("id") String id, @Param("keyword") String keyword);
	public List<StatusFinalInfoVO> findFinStat(@Param("id") String id, @Param("keyword") String keyword);


//  좋아요 관련
	// 커뮤니티에 좋아요한 글 정보
	public List<LikesListCommVO> findLikesComm(@Param("id") String id);
	// PR게시판에 좋아요 한 글 정보
	public List<LikesListPRVO> findLikesPR(@Param("id") String id);
    
	
// 커뮤니티 글 관리
	// 작성한 커뮤니티 글 리스트
	public List<CommInfoVO> findCommList(@Param("id") String id, @Param("keyword") String keyword);	
	// 작성한 커뮤니티 댓글 리스트
	public List<CommReplyInfoVO> findCommReplyList(@Param("id") String id, @Param("keyword") String keyword);	


}