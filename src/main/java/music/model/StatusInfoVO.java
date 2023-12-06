package music.model;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class StatusInfoVO {
	// jobBoard
    private Integer jobNo;		// 게시글 번호
    private String job_userId;		// 공고 작성자 id
    private String jobCd;		// 구분(포지션 유형)
    private String jobFin;		// 마감
    @DateTimeFormat(pattern="yyyy-mm-dd")
    private Date jobEndDate;	// 모집 마감일
    
    private String jobSub;		// 제목
    
    // jobApp(신청자)
    private String userId;	// 신청자 id
    // 신청자 지원 상태
    private String appCheck;	// 승인
    private String appDone;		// 완료
    private String appDelYn;	// 취소
    
    private String appName;	// 신청자 이름
}
