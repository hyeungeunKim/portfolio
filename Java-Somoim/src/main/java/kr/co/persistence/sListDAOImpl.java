package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.StatusVO;
import kr.co.domain.sListVO;

@Repository
public class sListDAOImpl implements sListDAO {
	
	private final String NAMESPACE = "kr.co.mapper.sListMapper";

	@Inject
	private SqlSession session;
	
	@Override
	public sListVO slist_list(int cno) throws Exception {
		return session.selectOne(NAMESPACE+".slist_list", cno);
	}

	@Override
	public List<sListVO> slist_tab_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".slist_tab_list", cno);
	}

	@Override
	public void update_s_join_cnt(int sl_no) throws Exception {
		// TODO Auto-generated method stub
		session.update(NAMESPACE+".update_s_join_cnt", sl_no);
	}

	@Override
	public void join_sList_insert(int cno, int sl_no, String mid) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cno", cno);
		map.put("sl_no", sl_no);
		map.put("mid", mid);
		session.insert(NAMESPACE+".join_sList_insert", map);
	}

	@Override
	public List<StatusVO> join_sList_select(int sl_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".join_sList_select", sl_no);
	}

	@Override
	public List<StatusVO> join_sList_member(int cno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".join_sList_member", cno);
	}

	@Override
	public void slist_create(sListVO slistVo) {
		// TODO Auto-generated method stub
		session.insert(NAMESPACE+".slist_create", slistVo);
	}

	@Override
	public void update_slist_member(int sl_no) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE+".update_slist_member", sl_no);
	}

	@Override
	public void delete_slist_member(int sl_no, String mid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("sl_no", sl_no);
		map.put("mid", mid);
		session.update(NAMESPACE+".delete_slist_member", map);
	}
	
		@Override
	public sListVO slistBySlno(int sl_no) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".slistBySlno", sl_no);
	}

	@Override
	public void slist_update(sListVO slistVo) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE+".slist_update", slistVo);
	}

	@Override
	public void slist_delete(int sl_no) {
		// TODO Auto-generated method stub
		session.delete(NAMESPACE+".slist_delete", sl_no);
	}
	
}
