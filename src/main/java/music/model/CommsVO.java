package music.model;

import java.util.List;

import lombok.Data;

@Data
public class CommsVO {
	private String id;
	private String keword;
	private List<CommInfoVO> commInfoVOs;
	
	public CommsVO(List<CommInfoVO> commInfoVOs) {
		this.commInfoVOs = commInfoVOs;
	}

}
