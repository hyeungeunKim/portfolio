package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.domain.JoinSlistVO;
import kr.co.domain.MemberVO;
import kr.co.domain.sListVO;
import kr.co.service.SettingService;

@Controller
@RequestMapping("/setting")
public class SettingController {

	@Inject
	private SettingService setting_service;
	
	@RequestMapping(value="/info", method=RequestMethod.GET)
	public void info(@ModelAttribute("cri") Criteria cri, Model model, String mid, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		mid = memberVO.getMid();
		
		MemberVO memberVo = getMemberInfo(mid);
		model.addAttribute("memberVo", memberVo);
		
		List<CrewVO> openCrewList = getOpenCrew(cri, mid);
		model.addAttribute("openCrewList", openCrewList);
		
		List<CrewVO> joinCrewList = getJoinCrew(cri, mid);
		model.addAttribute("joinCrewList", joinCrewList);
		
		List<JoinSlistVO> joinSlist = getJoinSlist(cri, mid);
		model.addAttribute("joinSlist", joinSlist);
	}
	
	private MemberVO getMemberInfo(String mid) throws Exception {
		MemberVO memberVo = setting_service.memberInfo(mid);
		
		String birth = memberVo.getBirth();
		String year = birth.substring(0, 4);
		String month = birth.substring(4, 6);
		String day = birth.substring(6, 8);
		
		birth = year + "." + month + "." + day;
		memberVo.setBirth(birth);
		
		return memberVo;
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
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public void mypage() throws Exception{
	}
	
	@RequestMapping(value="/member_update", method=RequestMethod.POST)
	public void member_update(MemberVO member_vo,@RequestParam("birth1") String birth1, @RequestParam("birth2") String birth2, @RequestParam("birth3") String birth3,
			@RequestParam("phone1") String phone1, @RequestParam("phone2") String phone2, @RequestParam("phone3") String phone3) throws Exception{
		if (Integer.parseInt(birth2) < 10) {
			birth2 = "0"+birth2;
		}
		if (Integer.parseInt(birth3) < 10) {
			birth3 = "0"+birth3;
		}
		member_vo.setBirth(birth1+birth2+birth3);
		member_vo.setPhone(phone1+phone2+phone3);
		setting_service.memberUpdate(member_vo);
		System.out.println("수정되었습니다.");
		System.out.println(member_vo);
	}
	
	@ResponseBody
	@RequestMapping(value="/memberDelete/{mid}")
	public void memberDelete(@PathVariable("mid") String mid)throws Exception{
		setting_service.memberDelete(mid);
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		session.removeAttribute("login");
		session.invalidate();
		return "redirect:/intro/login";
	}
	
}
