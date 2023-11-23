package music.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.mapper.prDao;
import music.model.prVO;

@Service
public class prServiceImpl implements prService{

	@Autowired
	private prDao dao;
	
	@Override
	public void inserPr(prVO pr) {
		dao.insertPr(pr);
	}

}
