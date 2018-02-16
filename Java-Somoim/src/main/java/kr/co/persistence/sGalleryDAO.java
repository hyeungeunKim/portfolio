package kr.co.persistence;

import java.util.List;

import kr.co.domain.sGalleryVO;

public interface sGalleryDAO {
	
	abstract void sgallery_create(sGalleryVO sgallery_vo) throws Exception;
	abstract List<sGalleryVO> sgallery_list(int cno) throws Exception;
	abstract void sgallery_delete(int sg_no) throws Exception;
	
	abstract sGalleryVO sgallery_detail(int sg_no) throws Exception;
	
	abstract String sgallery_member_name(int sg_no) throws Exception;
}

