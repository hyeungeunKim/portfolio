package kr.co.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.domain.MemberVO;
import kr.co.service.MemberService;

@Controller
@RequestMapping("/intro")
public class IntroController {
	
	@Inject
	private MemberService service;
	
	@RequestMapping(value="/intro", method=RequestMethod.GET)
	public void intro() throws Exception{
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void member_loginGet() throws Exception{
		
	}
	
	@RequestMapping(value="/login_post", method=RequestMethod.POST)
	public String member_loginPost(MemberVO member_vo, Model model) throws Exception{
		MemberVO vo = service.member_login(member_vo);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar c1 = Calendar.getInstance();
        String Today = sdf.format(c1.getTime());
        service.update_visit(Today);

		if (vo == null) {
			return "redirect:/intro/loginfail"; 
		}
		model.addAttribute("MemberVO", vo);
		System.out.println("로그인성공");
		return "redirect:/around/member_info";
	}
	
	@RequestMapping(value="/loginfail", method=RequestMethod.GET)
	public void member_loginFalse() throws Exception{
		
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void member_joinGet() throws Exception{
		
	}
	
	@RequestMapping(value="/midcheck", method=RequestMethod.POST)
	public @ResponseBody Object mid_check(@ModelAttribute("MemberVO") MemberVO memberVO) throws Exception{
		MemberVO resultVO = service.member_select(memberVO);
		System.out.println("===================================================================");
		System.out.println(resultVO);
		return resultVO;
		
	}
	
	@RequestMapping(value="/join_post", method=RequestMethod.POST)
	public String member_joinPost(MemberVO member_vo, @RequestParam("birth1") String birth1, @RequestParam("birth2") String birth2, @RequestParam("birth3") String birth3,
			@RequestParam("phone1") String phone1, @RequestParam("phone2") String phone2, @RequestParam("phone3") String phone3) throws Exception{
		if (Integer.parseInt(birth2) < 10) {
			birth2 = "0"+birth2;
		}
		if (Integer.parseInt(birth3) < 10) {
			birth3 = "0"+birth3;
		}
		member_vo.setBirth(birth1+birth2+birth3);
		member_vo.setPhone(phone1+phone2+phone3);
		service.member_join(member_vo);
		System.out.println("===================================================================");
		System.out.println(member_vo);
		System.out.println("가입되었습니다.");
		System.out.println("===================================================================");
		return "redirect:/intro/login";
	}
	

}
