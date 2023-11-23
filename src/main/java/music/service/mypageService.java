package music.service;

import java.util.List;

import music.model.UserInfoVO;

public interface mypageService {
	
	List<UserInfoVO> findUser(String id);
	
}
