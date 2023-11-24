package music.mapper;

import java.util.List;

// Mapper클래스 사용
import org.apache.ibatis.annotations.Mapper;

import music.model.StatusInfoVO;
import music.model.UserInfoVO;

@Mapper
public interface mypageDao {

//	글 리스트에 댓글 수 및 좋아요 수 가져오기
// 	구인 게시판 관련
	// 1. 유저가 구인페이지에 작성한 내용을 가져옴
    public List<StatusInfoVO> findjob(String id);
    
    // 2. 유저가 구인페이지에 댓글을 작성한 내용을 가져옴
    public List<UserInfoVO> findReply(String id);

    
// 	커뮤니티 게시판 관련
    // 1. 유저가 커뮤니티 게시판에 작성한 내용
    
    // 2. 유저가 커뮤니티 게시판에 작성한 댓글
    
    // 3. 유저가 커뮤니티 게시판에 좋아요 설정한 글


// PR게시판에 좋아요 한 글을 가져옴    
    
	// 1. PR게시판에 작성한 내용을 불러와서, 마이페이지 메인 profile에 띄움
    public UserInfoVO findById(String id);
    
    // 2. PR게시물 중 내가 좋아요 한 글 리스트를 가져오게 설정
    public UserInfoVO findLike(String id);
    
    
// 	문의 글 작성한 내용을 가져옴
    public List<UserInfoVO> findQnA(String id);
   
    
    

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