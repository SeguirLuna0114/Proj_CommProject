package music.service;

import java.util.List;

import music.model.StatusInfoVO;

public interface mypageService {
	
	// 구인게시판에 작성한 글 전체목록 출력
	List<StatusInfoVO> stat_viewAll(String id);
	
}
