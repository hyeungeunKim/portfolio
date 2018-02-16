package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.persistence.MyDAO;

@Service
public class MyServiceImpl implements MyService {

	@Inject
	MyDAO my_dao;
	
	@Override
	public List<CrewVO> crew_sel_list(Criteria cri, String mid) throws Exception {
		// TODO Auto-generated method stub
		return my_dao.crew_sel_list(cri, mid);
	}

	@Override
	public List<CrewVO> attend_crew_list(String mid) throws Exception {
		// TODO Auto-generated method stub
		return my_dao.attend_crew_list(mid);
	}

}
