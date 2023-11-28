package music.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.mapper.mypageDao;
import music.model.InfoAllVO;
import music.model.InfoCountVO;
import music.model.JobInfoVO;
import music.model.StatusCountVO;
import music.model.UserInfoVO;

// Service 구현 클래스 : 메소드를 명시하여, 데이터베이스와 상호작용 추상화
@Service
public class mypageSerciveImpl implements mypageService{

	// mapper클래스의 DAO클래스 사용
	@Autowired
	private mypageDao myDao;
	
	// mypageService클래스에서 설계한 메소드 오버라이드해서 구현
	@Override
	public InfoAllVO viewMyPage(String id) {
		
		List<UserInfoVO> userInfos = myDao.findUser(id);
		List<InfoCountVO> infoCounts = myDao.findInfoCounts(id);
		List<JobInfoVO> recJobInfos = myDao.findrecJob(id);
		List<StatusCountVO> statCounts = myDao.findCounts(id);
		
		// 해당 객체에 담아서 모든 정보 반환
		InfoAllVO infoAllDto = new InfoAllVO();
		
		return infoAllDto;
	}
	
	

}

