package music.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.mapper.mypageDao;
import music.model.StatusInfoVO;

// Service 구현 클래스 : 메소드를 명시하여, 데이터베이스와 상호작용 추상화
@Service
public class mypageSerciveImpl implements mypageService{

	// mapper클래스의 DAO클래스 사용
	@Autowired
	private mypageDao dao;
	
	// mypageService클래스에서 설계한 메소드 오버라이드해서 구현
	@Override
	public List<StatusInfoVO> stat_viewAll(String id) {
		// 구인게시판에 작성한 글 전체목록 출력
		return dao.findjob(id);
	}
	
	

}

//private final ApplicationStatusDao applicationStatusDao;
//
//public InfoAllDto viewMyPage(Integer id) {
//    List<UserInfoDto> userInfoDtos = applicationStatusDao.findUser(id);
//    List<InfoCountDto> infoCountDtos = applicationStatusDao.findInfoCounts(id);
//    List<CompanyInfoDto> companyInfoDtos = applicationStatusDao.findCompany(id);
//    if (companyInfoDtos.size() == 0) {
//        companyInfoDtos = applicationStatusDao.findCompanyIfNull();
//    }
//    List<StatusCountDto> statusCountDtos = applicationStatusDao.findCounts(id);
//    InfoAllDto infoAllDto = new InfoAllDto(userInfoDtos, infoCountDtos, companyInfoDtos, statusCountDtos);
//    return infoAllDto;
//}
