package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.ChattingVO;
import kr.co.persistence.ChattingDAO;


@Service
public class ChattingServiceImpl implements ChattingService{

	@Inject
	ChattingDAO dao;
	
	@Override
	public void insert_msg(ChattingVO vo) throws Exception {
		dao.insert_msg(vo);
		
	}

	@Override
	public List<ChattingVO> msg_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		
		return dao.msg_list(cno);
	}

	@Override
	public List<String> msg_member(int cno) throws Exception {
		// TODO Auto-generated method stub
		return dao.msg_member(cno);
	}

}
