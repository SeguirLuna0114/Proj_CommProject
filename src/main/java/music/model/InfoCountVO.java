package music.model;

import lombok.Data;

@Data
public class InfoCountVO {
    private Integer id;
    private Integer statusAll;
    private Integer likesCount;
    private Integer subscribesCount;
    private Integer requestsCount;
	
	// lombok사용 시, getter & setter메소드 불필요함 => 어노테이션 사용
}