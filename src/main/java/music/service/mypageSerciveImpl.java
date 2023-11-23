package music.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.mapper.mypageDao;
import music.model.UserInfoVO;

@Service
public class mypageSerciveImpl implements mypageService{

	@Autowired
	private mypageDao dao;
	
	@Override
	public List<UserInfoVO> findUser(String id) {
		return dao.findUser(id);
	}

}