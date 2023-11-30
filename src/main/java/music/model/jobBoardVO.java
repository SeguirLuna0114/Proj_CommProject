package music.model;

import lombok.Data;

@Data
public class jobBoardVO {
    private Integer jobno;  // 구인 게시글 번호
    private String userid;  // id

    // jobBoard.jobCd
    private String jobcd;    // 공고 분류
    // 공고 분류에 해당하는 이미지 파일
//    private String photo;

    // jobBoard.jobPlace
    private String jobplace;    // 지역

    // 공고 제목
    private String jobsub;

    // 공고 내용
    private String jobtext;

    // 공고 진행상태
    private String jobFin;

}
