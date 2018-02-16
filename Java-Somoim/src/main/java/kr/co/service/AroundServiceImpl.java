package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.MemberVO;
import kr.co.persistence.AroundDAO;

@Service
public class AroundServiceImpl implements AroundService {
	
	@Inject
	AroundDAO around_dao;
	
	@Override
	public MemberVO memberInfo(String mid) throws Exception {
		return around_dao.memberInfo(mid);
	}

	@Override
	public List<MemberVO> member_list(String mid, String address) throws Exception {
		return around_dao.member_list(mid, address);
	}

}
