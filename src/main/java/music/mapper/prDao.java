package music.mapper;

// Mapper클래스 사용
import org.apache.ibatis.annotations.Mapper;

import music.model.prVO;

@Mapper
public interface prDao {

	public void insertPr(prVO pr);
	
}
