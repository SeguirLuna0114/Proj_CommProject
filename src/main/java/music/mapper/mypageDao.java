package music.mapper;

import java.util.List;

// Mapper클래스 사용
import org.apache.ibatis.annotations.Mapper;

import music.model.UserInfoVO;

@Mapper
public interface mypageDao {

// User에게 추천공고 리스트를 보여주기 위함
    // 유저 정보 가져옴(From prBoard pr LEFT OUTER JOIN member us) pr테이블 + 회원테이블
    public List<UserInfoVO> findUser(String id);

    // 회사 정보 가져옴
//    public List<
}