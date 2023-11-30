package music.model;

import lombok.Data;

@Data
public class KeywordVO {
 	private String positionsCodeNames;
	private String regionsCodeNames;
	private String carrerCodeNames;
	private Integer page;
	private Integer startNum;   
}
