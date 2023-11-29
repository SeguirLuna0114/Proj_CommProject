package music.model;

import java.util.List;

import lombok.Data;

@Data
public class KeywordVO {
 	private String positionsCodeNames;
	private String regionsCodeNames;
	private String carrerCodeNames;
	private List<String> skillsCodeNames;
	private Integer page;
	private Integer startNum;   
}
