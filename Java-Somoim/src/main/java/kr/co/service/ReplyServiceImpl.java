package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.ReplyVO;
import kr.co.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	ReplyDAO reply_dao;
	
	@Override
	public void reply_create_sgallery(ReplyVO reply_vo) throws Exception {
		// TODO Auto-generated method stub
		reply_dao.reply_create_sgallery(reply_vo);
	}
	
	@Override
	public void reply_create_sboard(ReplyVO reply_vo) throws Exception {
		// TODO Auto-generated method stub
		reply_dao.reply_create_sboard(reply_vo);
	}


	@Override
	public List<ReplyVO> reply_list_sgallery(int sg_no) throws Exception {
		// TODO Auto-generated method stub
		return reply_dao.reply_list_sgallery(sg_no);
	}

	@Override
	public List<ReplyVO> reply_list_sboard(int sb_no) throws Exception {
		// TODO Auto-generated method stub
		return reply_dao.reply_list_sboard(sb_no);
	}

	@Override
	public void reply_update(ReplyVO reply_vo) throws Exception {
		// TODO Auto-generated method stub
		reply_dao.reply_update(reply_vo);
	}

	@Override
	public void reply_delete(int re_no) throws Exception {
		// TODO Auto-generated method stub
		reply_dao.reply_delete(re_no);
	}

}
