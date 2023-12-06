package music.model;

import lombok.Data;

@Data
public class KeywordVO {
	// JobBoard데이터를 위함
 	private String jobplaceName;
	private String jobcdName;
	
	// prLike 데이터를 위함
	private String prcareerName;
	private String prmajorName;
	private String prlocName;
	private String prhashName;
	
	// 공통
	private Integer page;
	private Integer startNum;   
}
