package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.domain.MemberVO;

@Repository
public class CrewDAOImpl implements CrewDAO {

	private final String NAMESPACE = "kr.co.mapper.CrewMapper";

	@Inject
	private SqlSession session;
	
	@Override
	public List<CrewVO> crew_list(Criteria cri, String mid) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("mid", mid);
		return session.selectList(NAMESPACE+".crew_list", map);
	}

	@Override
	public CrewVO crew_tab_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".crew_tab_list", cno);
	}

	@Override
	public void crew_update_role(int cno, String mid) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cno", cno);
		map.put("mid", mid);
		session.update(NAMESPACE+".crew_update_role",map);
	}

	@Override
	public void crew_create(CrewVO crew_vo) throws Exception {
		session.insert(NAMESPACE+".crew_create", crew_vo);
	}

	@Override
	public int getCno() throws Exception {
		Integer maxCno = session.selectOne(NAMESPACE+".getCno");
		if (maxCno == null) {
			maxCno = 0;
		}
		return maxCno;
	}
	
	private int getId(){
		Integer id = session.selectOne(NAMESPACE+".getId");
		if(id == null){
			id=0;
		}
		return ++id; //id++은 실행되지 않음
	}

	@Override
	public void addAttach(String fullName, int cno) {
		// TODO Auto-generated method stub
		int id = getId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fullName", fullName);
		map.put("cno", cno);
		map.put("id", id);
		session.insert(NAMESPACE+".addAttach", map);
		
	}

	@Override
	public void join_Crew(int cno, String mid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cno", cno);
		map.put("mid", mid);
		session.insert(NAMESPACE+".join_Crew", map);
	}

	@Override
	public void crew_delete_role(int cno) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE+".crew_delete_role", cno);
	}

	@Override
	public void update_crew_cnt(int cno) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE+".update_crew_cnt", cno);
		
	}
	@Override
	public void crewJoincntSub(int cno) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE+".crewJoincntSub", cno);
	}

	@Override
	public void slistJoincntSub(int cno, String mid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cno", cno);
		map.put("mid", mid);
		session.update(NAMESPACE+".slistJoincntSub", map);
	}

	@Override
	public void deleteStatus(int cno, String mid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cno", cno);
		map.put("mid", mid);
		session.delete(NAMESPACE+".deleteStatus", map);
	}

	@Override
	public MemberVO memberDetail(String mid) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".memberDetail", mid);
	}

	@Override
	public List<CrewVO> memberCrewList(String mid) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".memberCrewList", mid);
	}

	@Override
	public void update_join_cnt(int cno) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE+".update_join_cnt", cno);
	}

}
