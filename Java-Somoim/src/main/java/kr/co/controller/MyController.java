package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.domain.MemberVO;
import kr.co.domain.sListVO;
import kr.co.service.MyService;
import kr.co.service.sListService;

@Controller
@RequestMapping("/my")
public class MyController {
	
	@Inject
	private MyService my_service;
	
	@Inject
	private sListService sList_service;
	
	@RequestMapping(value="/mylist", method=RequestMethod.GET)
	public void mylist(@ModelAttribute("cri") Criteria cri, Model model, String mid, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		mid = memberVO.getMid();
		
		List<CrewVO> sel_list = my_service.crew_sel_list(cri, mid);
		model.addAttribute("sel_list", sel_list);
		
		List<CrewVO> attend_list = my_service.attend_crew_list(mid);
		model.addAttribute("attend_list", attend_list);
	}
	
	@ResponseBody
	@RequestMapping(value="/list_sList/{cno}")
	public sListVO my_sList(@PathVariable("cno")int cno, Model model)throws Exception{
		sListVO sList_vo=sList_service.slist_list(cno);

		String attend_date = sList_vo.getAttend_date();
		
		String year = attend_date.substring(0, 4);
		String month = attend_date.substring(4, 6);
		String day = attend_date.substring(6, 8);
		String hour = attend_date.substring(8, 10);
		String minute = attend_date.substring(10, 12);
		
		attend_date = year + "/" + month + "/" + day + " " + hour + "시" + minute + "분";
		sList_vo.setAttend_date(attend_date);

		return sList_vo;
	}
}
