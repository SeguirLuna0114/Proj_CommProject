package music.model;

import java.util.List;

import lombok.Data;

@Data
public class PagingMsgListVO {
    private List<MessageInfoVO> messageInfoVOs;
    private PagingVO pagingVO;
}
