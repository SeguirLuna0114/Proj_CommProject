package music.mapper;

import java.util.List;

// Mapper클래스 사용
import org.apache.ibatis.annotations.Mapper;

import music.model.UserInfoVO;

@Mapper
public interface mypageDao {

    // 유저 정보 가져옴(From prBoard pr LEFT OUTER JOIN member us) pr테이블 + 회원테이블
    public List<UserInfoVO> findUser(String id);

    
    
    /** 회사 정보 가져와서, User(피고용자)에게 추천공고 리스트를 보여주기 위함
     *	- 회원테이블로 고용자와 노동자를 구분할 수 없기에 안됨
     */
//  public List<CompInfoVO> findComp(String id);
//	public List<CompanyInfoDto> findCompanyIfNull();
//
//	public List<InfoCountDto> findInfoCounts(Integer id);
//
//	public List<StatusInfoDto> findAll(@Param("id") Integer id, @Param("keyword") String keyword);
//
//	public List<StatusCountDto> findCounts(Integer id);
//
//	public List<StatusWaitingInfoDto> findWaiting(@Param("id") Integer id, @Param("keyword") String keyword);
//
//	public List<StatusFinalInfoDto> findFinal(@Param("id") Integer id, @Param("keyword") String keyword);
//
//	public List<RequestsInfoDto> findRequest(@Param("id") Integer id, @Param("keyword") String keyword);
//
//	public ApplicationStatus findById(Integer id);
//
//	public void update(Integer id, ApplicationStatus applicationStatus);
//
//	public void deleteById(Integer id);


}