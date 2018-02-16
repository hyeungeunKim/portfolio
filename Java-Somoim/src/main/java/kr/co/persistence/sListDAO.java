package kr.co.persistence;

import java.util.List;

import kr.co.domain.StatusVO;
import kr.co.domain.sListVO;

public interface sListDAO {
	public abstract sListVO slist_list(int cno) throws Exception;
	public abstract List<sListVO> slist_tab_list(int cno) throws Exception;
	public abstract void update_s_join_cnt(int sl_no) throws Exception;
	public abstract void join_sList_insert(int cno,int sl_no,String mid)throws Exception;
	public abstract List<StatusVO> join_sList_select(int sl_no)throws Exception;
	public abstract List<StatusVO> join_sList_member(int cno)throws Exception;
	public abstract void slist_create(sListVO slistVo);
	public abstract void update_slist_member(int sl_no);
	public abstract void delete_slist_member(int sl_no,String mid);
	public abstract sListVO slistBySlno(int sl_no);
	public abstract void slist_update(sListVO slistVo);
	public abstract void slist_delete(int sl_no);
}
