package music.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.mapper.mypageDao;
import music.model.UserInfoVO;

@Service
public class mypageSerciveImpl implements mypageService{

	@Autowired
	private mypageDao dao;
	
	@Override
	public List<UserInfoVO> findUser(String id) {
		return dao.findUser(id);
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
