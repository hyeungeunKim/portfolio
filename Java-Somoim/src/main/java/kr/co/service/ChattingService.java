package kr.co.service;

import java.util.List;

import kr.co.domain.ChattingVO;

public interface ChattingService {
	void insert_msg(ChattingVO vo)throws Exception;
	List<ChattingVO> msg_list(int cno)throws Exception;
	List<String> msg_member(int cno)throws Exception;
}
