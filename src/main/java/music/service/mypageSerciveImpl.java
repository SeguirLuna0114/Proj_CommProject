package music.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.mapper.mypageDao;
import music.model.CommInfoVO;
import music.model.CommReplyInfoVO;
import music.model.CommReplysVO;
import music.model.CommsVO;
import music.model.InfoAllVO;
import music.model.InfoCountVO;
import music.model.JobInfoVO;
import music.model.KeywordVO;
import music.model.LikesListCommVO;
import music.model.LikesListPRVO;
import music.model.PagingJobManageVO;
import music.model.PagingVO;
import music.model.PrBoardVO;
import music.model.StatusAllVO;
import music.model.StatusCountVO;
import music.model.StatusFinalInfoVO;
import music.model.StatusFinalVO;
import music.model.StatusInfoVO;
import music.model.StatusWaitingInfoVO;
import music.model.StatusWaitingVO;
import music.model.UserInfoVO;
import music.model.jobBoardVO;

// Service 구현 클래스 : 메소드를 명시하여, 데이터베이스와 상호작용 추상화
// mypageService클래스에서 설계한 메소드 오버라이드해서 구현
@Service
public class mypageSerciveImpl implements mypageService {

	// mapper클래스의 DAO클래스 사용
	@Autowired
	private mypageDao myDao;

	@Override
	// 현재 지원 현황
	public InfoAllVO viewMyPage(String id) {
		List<UserInfoVO> userInfos = myDao.findUser(id);
		List<InfoCountVO> infoCounts = myDao.findInfoCounts(id);
		List<JobInfoVO> recJobInfos = myDao.findrecJob(id);
		List<StatusCountVO> statCounts = myDao.findCounts(id);

		// 해당 객체에 담아서 모든 정보 반환
		InfoAllVO infoAllDto = new InfoAllVO();
        infoAllDto.setUserInfoVOs(userInfos);
        infoAllDto.setInfoCountVOs(infoCounts);
        infoAllDto.setJobInfoVOs(recJobInfos);
        infoAllDto.setStatusCountVOs(statCounts);

		return infoAllDto;
	}

	// 현재 구인 현황
	@Override
	public List<jobBoardVO> viewMyBoard(String id) {
		List<jobBoardVO> jobBoardVOs = myDao.findAllBoards(id);
		// 작성한 모든 구인공고 정보 반환
		return jobBoardVOs;
	}
	
	// 모든 유저 데이터 가져옴
	@Override
	public List<jobBoardVO> viewAllJobDatas() {
		List<jobBoardVO> alljobDatas = myDao.findAllJobDatas();
		return alljobDatas;
	}
	
	// 구인 현황 - 페이지 처리
//	public PagingJobManageVO pagingViewBoard(String id, Integer page) {
//		if(page == null) {
//			page = 0;
//		}
//		// 변수 설정
//		int startNum = page * 5;
//
//		PagingJobManageVO pagingJobManageVO = new PagingJobManageVO();
//		pagingJobManageVO.setJobBoardVOs(myDao.findAllBoards(id));
//
//		return pagingJobManageVO;
//	}
// 페이지 처리
//	public PagingVO paging(KeywordVO keywordVO) {
//		PagingVO paging = myDao.paging(keywordVO);
//
//		final int blockCount = 16;
//		int currentBlock = keywordVO.getPage()/ blockCount;
//		int startPageNum = 1 + blockCount * currentBlock;
//		int lastPageNum = 16 + blockCount * currentBlock;
//		
//		if(paging.getTotalPage() < lastPageNum) {
//			lastPageNum = paging.getTotalPage();
//		}
//		
//		paging.setBlockCount(blockCount);
//		paging.setCurrentBlock(currentBlock);
//		paging.setStartPageNum(startPageNum);
//		paging.setLastPageNum(lastPageNum);	
//
//		return paging;
//	}


// 지원 현황 리스트 페이지(applyStatus)
	// 전체 지원 현황
	@Override
	public StatusAllVO viewAppAll(String id, String keyword) {
		List<StatusCountVO> statusCountVOs = myDao.findCounts(id);
		List<StatusInfoVO> statusInfoVOs = myDao.findAllStat(id, keyword);
		StatusAllVO statusAllVO = new StatusAllVO(statusCountVOs, statusInfoVOs);
		statusAllVO.setKeyword(keyword);
		statusAllVO.setUserId(id);
		
		return statusAllVO;
	}

	// 현재 지원 후 대기 현황
	@Override
	public StatusWaitingVO viewAppWait(String id, String keyword) {
		List<StatusCountVO> statusCountVOs = myDao.findCounts(id);
		List<StatusWaitingInfoVO> statusWaitingInfoVOs = myDao.findWaitingStat(id, keyword);
		StatusWaitingVO statusWaitingVO = new StatusWaitingVO(statusCountVOs, statusWaitingInfoVOs);
		statusWaitingVO.setKeyword(keyword);
		statusWaitingVO.setUserId(id);
		
		return statusWaitingVO;
	}
	
	// 지원 완료(승인) 현황
	@Override
	public StatusFinalVO viewAppFin(String id, String keyword) {
		List<StatusCountVO> statusCountVOs = myDao.findCounts(id);
		List<StatusFinalInfoVO> statusFinalInfoVOs = myDao.findFinStat(id, keyword);
		StatusFinalVO statusFinalVO = new StatusFinalVO(statusCountVOs, statusFinalInfoVOs);
		statusFinalVO.setKeyword(keyword);
		statusFinalVO.setUserId(id);
		
		return statusFinalVO;		
	}

	
	
// 좋아요 관련
	// 커뮤니티에 좋아요 한 글 리스트
	@Override
	public List<LikesListCommVO> viewLikeListComm(String id) {
		List<LikesListCommVO> likeComm = myDao.findLikesComm(id);
		return likeComm;
	}
	
	// PR글 좋아요 설정한 리스트
	@Override
	public List<LikesListPRVO> viewLikeListPR(String id) {
		List<LikesListPRVO> likePR = myDao.findLikesPR(id);
		return likePR;
	}
	
	// PR게시판에 모든 유저들이 작성한 항목 데이터 리스트
	@Override
	public List<PrBoardVO> viewAllPrDatas() {
		List<PrBoardVO> allPrDatas = myDao.findAllPrDatas();
		return allPrDatas;
	}

	
// 커뮤니티 작성 글 관리
	// 작성한 커뮤니티 글 리스트
	@Override
	public CommsVO viewCommLists(String id, String keyword) {
		List<CommInfoVO> commInfoVOs = myDao.findCommList(id, keyword);
		CommsVO commsVO = new CommsVO(commInfoVOs);
		commsVO.setKeword(keyword);
		commsVO.setId(id);
		return commsVO;
	}
	
	// 작성한 커뮤니티 댓글 리스트
	@Override
	public CommReplysVO viewCommReplyLists(String id, String keyword) {
		List<CommReplyInfoVO> commReplyInfoVOs = myDao.findCommReplyList(id, keyword);
		CommReplysVO commReplysVO = new CommReplysVO(commReplyInfoVOs);
		commReplysVO.setKeword(keyword);
		commReplysVO.setId(id);
		return commReplysVO;
	}
	
}
