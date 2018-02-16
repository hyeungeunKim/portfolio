package kr.co.service;

import java.util.List;

import kr.co.domain.sBoardVO;

public interface sBoardService {
	abstract void sboard_create(sBoardVO sboard_vo) throws Exception;
	abstract List<sBoardVO> sboard_list(int cno) throws Exception;
	
	abstract void sboard_update(sBoardVO sboard_vo) throws Exception;
	abstract void sboard_delete(int sb_no) throws Exception;
	
	abstract sBoardVO sboard_detail(int sb_no) throws Exception;
	
	abstract String sboard_detail_picture(int sb_no) throws Exception;
	
	abstract String sboard_member_name(int sb_no) throws Exception;
}
