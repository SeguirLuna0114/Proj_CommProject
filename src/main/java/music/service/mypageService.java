package music.service;

import music.model.InfoAllVO;

// 서비스 인터페이스 설계
public interface mypageService {
	
	// 회원 관련 모든 정보 가져오는 메소드
	public InfoAllVO viewMyPage(String id);
	
}
