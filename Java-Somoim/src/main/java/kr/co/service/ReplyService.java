package kr.co.service;

import java.util.List;

import kr.co.domain.ReplyVO;

public interface ReplyService {
	
	abstract void reply_create_sgallery(ReplyVO reply_vo) throws Exception;
	abstract void reply_create_sboard(ReplyVO reply_vo) throws Exception;
	
	abstract List<ReplyVO> reply_list_sgallery(int sg_no) throws Exception;
	abstract List<ReplyVO> reply_list_sboard(int sb_no) throws Exception;
	
	abstract void reply_update(ReplyVO reply_vo) throws Exception;
	abstract void reply_delete(int re_no) throws Exception;
	
}
