package kr.co.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.MemberVO;
import kr.co.domain.ReplyVO;
import kr.co.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {

	@Inject
	private ReplyService reply_service;
	
	@RequestMapping(value="/sgallery", method=RequestMethod.POST)
	public ResponseEntity<String> create(@RequestParam("sg_no") int sg_no, ReplyVO reply_vo, HttpServletRequest request) throws Exception{
		
		System.out.println("!!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
		System.out.println(sg_no);
		
		ResponseEntity<String> entity=null;
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		String mid = memberVO.getMid(); 
		
		reply_vo.setMid(mid);
		reply_vo.setSg_no(sg_no);
		
		reply_service.reply_create_sgallery(reply_vo);
		
		entity = new ResponseEntity<String>("INSERT_SUCCESS", HttpStatus.OK);
		
		return entity;
		
	}	
	
	
	@RequestMapping(value="/sgallery/{cno}/{sg_no}")
	public ResponseEntity<List<ReplyVO>> reply_list_sgallery(@PathVariable("sg_no") Integer sg_no, @PathVariable("cno") Integer cno) throws Exception{
		
		ResponseEntity<List<ReplyVO>> entity=null;
		
		List<ReplyVO> list = reply_service.reply_list_sgallery(sg_no);
		
		entity = new ResponseEntity<List<ReplyVO>>(list, HttpStatus.OK);
		
		System.out.println("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
		System.out.println(entity);
		
		return entity;
	}
	
	
	@RequestMapping(value="/sboard", method=RequestMethod.POST)
	public ResponseEntity<String> create_sboard(@RequestParam("sb_no") int sb_no, ReplyVO reply_vo, HttpServletRequest request) throws Exception{
		
		ResponseEntity<String> entity=null;
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		String mid = memberVO.getMid(); 
		
		reply_vo.setMid(mid);
		reply_vo.setSb_no(sb_no);
		
		reply_service.reply_create_sboard(reply_vo);
		
		entity = new ResponseEntity<String>("INSERT_SUCCESS", HttpStatus.OK);
		
		return entity;
		
	}	
	
	
	@RequestMapping(value="/sboard/{cno}/{sb_no}")
	public ResponseEntity<List<ReplyVO>> reply_list_sboard(@PathVariable("sb_no") Integer sb_no, @PathVariable("cno") Integer cno) throws Exception{
		
		ResponseEntity<List<ReplyVO>> entity=null;
		
		List<ReplyVO> list = reply_service.reply_list_sboard(sb_no);
		
		entity = new ResponseEntity<List<ReplyVO>>(list, HttpStatus.OK);
		
		System.out.println("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
		System.out.println(entity);
		
		return entity;
	}
	
	@RequestMapping(value="sboard/all/{sb_no}", method=RequestMethod.GET)
	// 특정 글의 댓글을 모두 가져옴
	public ResponseEntity<List<ReplyVO>> list_sboard(@PathVariable("sb_no") Integer sb_no){
		
		ResponseEntity<List<ReplyVO>> entity = null;

		try {
			List<ReplyVO> list = reply_service.reply_list_sboard(sb_no);
			entity = new ResponseEntity<List<ReplyVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ReplyVO>>(HttpStatus.BAD_REQUEST);
		}	
		return entity;
	}
	
	@RequestMapping(value="sgallery/all/{sb_no}", method=RequestMethod.GET)
	// 특정 글의 댓글을 모두 가져옴
	public ResponseEntity<List<ReplyVO>> list_sgallery(@PathVariable("sg_no") Integer sg_no){
		
		ResponseEntity<List<ReplyVO>> entity = null;

		try {
			List<ReplyVO> list = reply_service.reply_list_sgallery(sg_no);
			entity = new ResponseEntity<List<ReplyVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ReplyVO>>(HttpStatus.BAD_REQUEST);
		}	
		return entity;
	}
	
	
	
	@RequestMapping(value="/{re_no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("re_no") Integer re_no){
		ResponseEntity<String> entity = null;
		try {
			reply_service.reply_delete(re_no);
			entity = new ResponseEntity<String>("DELETE_SUCCESS", HttpStatus.OK);
					
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{re_no}", method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("re_no") Integer re_no, @RequestBody ReplyVO vo){
		ResponseEntity<String> entity = null;
		vo.setRe_no(re_no);
		try {
			reply_service.reply_update(vo);
			entity = new ResponseEntity<String>("UPDATE_SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	



	
}
	
	

