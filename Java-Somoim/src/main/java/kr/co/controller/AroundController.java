package kr.co.controller;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.domain.JoinSlistVO;
import kr.co.domain.MemberVO;
import kr.co.service.AroundService;
import kr.co.service.SettingService;

@Controller
@RequestMapping("/around")
public class AroundController {
	
	@Inject
	private AroundService around_service;
	
	@Inject
	private SettingService setting_service;

	@RequestMapping(value="/member_info", method=RequestMethod.GET)
	public void member_info(String mid, String address, HttpServletRequest request, Model model) throws Exception{
		
		// 내정보
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		mid = memberVO.getMid();
		MemberVO memberVo = getMemberInfo(mid);
		model.addAttribute("memberVo", memberVo);
		
		// 내주변 리스트
		address = memberVO.getAddress();
		List<MemberVO> list = around_service.member_list(mid, address);
		MemberVO vo = new MemberVO();
		for (int i = 0; i < list.size(); i++) {
			vo = getMemberInfo(list.get(i).getMid());
			list.set(i, vo);
		}
		model.addAttribute("list", list);
	}
	
	private MemberVO getMemberInfo(String mid) throws Exception {
		MemberVO memberVo = around_service.memberInfo(mid);
		
		String birth = memberVo.getBirth();
		String year = birth.substring(0, 4);
		String month = birth.substring(4, 6);
		String day = birth.substring(6, 8);
		
		birth = year + "." + month + "." + day;
		memberVo.setBirth(birth);
		
		return memberVo;
	}
	
	@RequestMapping(value="/member_detail", method=RequestMethod.GET)
	public void member_info(@ModelAttribute("cri") Criteria cri, @RequestParam("mid") String mid, Model model) throws Exception{
		
		MemberVO memberVo = around_service.memberInfo(mid);
		model.addAttribute("memberVo", memberVo);
		
		List<CrewVO> openCrewList = getOpenCrew(cri, mid);
		model.addAttribute("openCrewList", openCrewList);
		
		List<CrewVO> joinCrewList = getJoinCrew(cri, mid);
		model.addAttribute("joinCrewList", joinCrewList);
		
		List<JoinSlistVO> joinSlist = getJoinSlist(cri, mid);
		model.addAttribute("joinSlist", joinSlist);
		
	}
	
	private List<CrewVO> getOpenCrew(Criteria cri, String mid) throws Exception {
		List<CrewVO> openCrewList = setting_service.openCrew(cri, mid);
		return openCrewList;
	}

	private List<CrewVO> getJoinCrew(Criteria cri, String mid) throws Exception {
		List<CrewVO> joinCrewList = setting_service.joinCrew(cri, mid);
		return joinCrewList;
	}
	
	private List<JoinSlistVO> getJoinSlist(Criteria cri, String mid) throws Exception {
		List<JoinSlistVO> joinSlist = setting_service.joinSlist(cri, mid);
		return joinSlist;
	}
	
	
}
