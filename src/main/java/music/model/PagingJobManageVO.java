package music.model;

import lombok.Data;

import java.util.List;

@Data
public class PagingJobManageVO {
    private List<jobBoardVO> jobBoardVOs;
    private PagingVO pagingVO;
}
