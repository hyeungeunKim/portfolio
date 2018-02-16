package kr.co.controller;

import java.io.File;


import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.ChattingVO;
import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.domain.MemberVO;
import kr.co.domain.ReplyVO;
import kr.co.domain.StatusVO;
import kr.co.domain.sBoardVO;
import kr.co.domain.sListVO;
import kr.co.domain.sGalleryVO;
import kr.co.service.ChattingService;
import kr.co.service.CrewService;
import kr.co.service.MemberService;
import kr.co.service.ReplyService;
import kr.co.service.sBoardService;
import kr.co.service.sListService;
import kr.co.service.sGalleryService;
import kr.co.util.MediaUtils;

@Controller
@RequestMapping("/crew")
public class CrewController {
	
	@Resource(name="sgallery_uploadPath")
	private String sgallery_uploadPath;
	
	@Resource(name="sboard_uploadPath")
	private String sboard_uploadPath;
	
	@Resource(name="crew_uploadPath")
	private String crew_uploadPath;
	

	@Inject
	private CrewService crew_service;

	@Inject
	private ChattingService ch_service;
	
	@Inject
	private sListService sList_service;
	
	@Inject 
	private sGalleryService sgallery_service; 
	
	@Inject
	private MemberService member_service;
	
	@Inject
	private sBoardService sboard_service;
	
	@Inject
	private ReplyService reply_service;
	
	/*---------------------------------------------------------------------------------------*/
	
	@RequestMapping(value="/sgallery_create", method=RequestMethod.GET) 
	public void sgallery_create_GET(@ModelAttribute("cno") int cno){
		
	} 
	
	@RequestMapping(value="/sgallery_create", method=RequestMethod.POST) 
	public String sgallery_create_POST(@RequestParam("cno") int cno, Model model, sGalleryVO sgallery_vo, String mid, HttpServletRequest request) throws Exception{ 	
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		
		mid = memberVO.getMid(); 
		cno = sgallery_vo.getCno();
		
		sgallery_vo.setMid(mid);
		sgallery_vo.setCno(cno);
		sgallery_service.sgallery_create(sgallery_vo); 
	
		return "redirect:/crew/tab_gallery?cno="+cno;	
	} 
	
	/*---------------------------------------------------------------------------------------*/
	
	@RequestMapping(value="/tab_gallery")
	public void tab_gallery_GET(@RequestParam("cno") int cno, Model model) throws Exception {
		List<sGalleryVO> list = sgallery_service.sgallery_list(cno);
		model.addAttribute("cno", cno);
		model.addAttribute("list", list);
	}
	
	/*---------------------------------------------------------------------------------------*/
	
	
	@RequestMapping(value="/sgallery_detail")
	public void sgallery_detail(@RequestParam("cno") int cno, @RequestParam("sg_no") int sg_no, Model model, HttpServletRequest request) throws Exception{
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		
		String mid = memberVO.getMid(); 
		System.out.println("########################################################################");
		System.out.println(sg_no);
		
		sGalleryVO sGalleryVO = sgallery_service.sgallery_detail(sg_no);
		String name = sgallery_service.sgallery_member_name(sg_no);
		
	
		model.addAttribute("sGalleryVO", sGalleryVO);
		model.addAttribute("name", name);
	}

	/*---------------------------------------------------------------------------------------*/
	
	@RequestMapping(value="/sgallery_delete", method=RequestMethod.POST)
	public String sgallery_delete(@RequestParam("sg_no") int sg_no, @RequestParam("cno") int cno) throws Exception{
	
		sGalleryVO vo = sgallery_service.sgallery_detail(sg_no);
		sgallery_service.sgallery_delete(sg_no);
		
		String prefix = vo.getSg_picture().substring(0, 12);
		String suffix = vo.getSg_picture().substring(14);
		
		File f = new File(sgallery_uploadPath+(prefix+suffix).replace('/', File.separatorChar));
		f.delete();
		File s = new File(sgallery_uploadPath+vo.getSg_picture().replace('/', File.separatorChar));
		s.delete();
		
		return "redirect:/crew/tab_gallery?cno="+cno;
	
	}

	/*--------------------------------------SBOARD------------------------------------*/
	
	
	@RequestMapping(value="/sboard_create", method=RequestMethod.GET) 
	public void sboard_create_GET(@ModelAttribute("cno") int cno){
	} 
	
	
	@RequestMapping(value="/sboard_create", method=RequestMethod.POST) 
	public String sboard_create_POST(@RequestParam("cno") int cno, Model model, sBoardVO sboard_vo, String mid, HttpServletRequest request) throws Exception{ 	
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		
		mid = memberVO.getMid(); 
		cno = sboard_vo.getCno();
		
		sboard_vo.setMid(mid);
		sboard_vo.setCno(cno);
		
		sboard_service.sboard_create(sboard_vo); 
		
		return "redirect:/crew/tab_board?cno="+cno;
	} 
	
	
	/*---------------------------------------------------------------------------------------*/
	
	@RequestMapping(value="/tab_board", method=RequestMethod.GET)
	public void  tab_board(@RequestParam("cno") int cno, Model model) throws Exception {
		List<sBoardVO> list = sboard_service.sboard_list(cno);
		model.addAttribute("cno", cno);
		model.addAttribute("list", list);
	}
	
	/*---------------------------------------------------------------------------------------*/
	
	@RequestMapping(value="/sboard_detail", method=RequestMethod.GET)
	public void sboard_detail_GET(@RequestParam("cno") int cno, @RequestParam("sb_no") int sb_no, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		
		String mid = memberVO.getMid();
		
		List<ReplyVO> replyVO = reply_service.reply_list_sboard(sb_no);
		sBoardVO sBoardVO = sboard_service.sboard_detail(sb_no);
		String name = sboard_service.sboard_member_name(sb_no);
		
		model.addAttribute("sBoardVO", sBoardVO);
		model.addAttribute("name", name);
		
	}
	
	/*---------------------------------------------------------------------------------------*/
	
	@RequestMapping(value="/sboard_delete", method=RequestMethod.POST)
	public String sboard_delete(@RequestParam("sb_no") int sb_no, @RequestParam("cno") int cno, RedirectAttributes rttr) throws Exception{
		sBoardVO vo = sboard_service.sboard_detail(sb_no);
		sboard_service.sboard_delete(sb_no);
		String sb_picture = vo.getSb_picture();
		
		if(sb_picture.equalsIgnoreCase("base")){
			File s = new File(sboard_uploadPath+vo.getSb_picture().replace('/', File.separatorChar));
			s.delete();
			
			return "redirect:/crew/tab_board?cno="+cno;
		} 
		
		String prefix = vo.getSb_picture().substring(0, 12);
		String suffix = vo.getSb_picture().substring(15);
		
		File f = new File(sboard_uploadPath+(prefix+suffix).replace('/', File.separatorChar));
		f.delete();
		File s = new File(sboard_uploadPath+vo.getSb_picture().replace('/', File.separatorChar));
		s.delete();
		
		return "redirect:/crew/tab_board?cno="+cno;
		
	
	}
	
	/*---------------------------------------------------------------------------------------*/

	@RequestMapping(value="/sboard_update", method=RequestMethod.GET)
	public sBoardVO sboard_update_GET(@RequestParam("sb_no") int sb_no, Model model) throws Exception{
		sBoardVO vo =  sboard_service.sboard_detail(sb_no);
		model.addAttribute("vo", vo);
		return vo;
	}
	
	@RequestMapping(value="/sboard_update", method=RequestMethod.POST)
	public String sboard_update_POST(@RequestParam("sb_no") int sb_no, @RequestParam("cno") int cno, Model model, sBoardVO sboard_vo, HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		
		String mid = memberVO.getMid();
		
		sboard_vo.setMid(mid);
		sboard_vo.setSb_no(sb_no);
		
		sboard_service.sboard_update(sboard_vo);
		
		System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
		System.out.println(sboard_vo.getCno());
		System.out.println(sboard_vo.getSb_no());
		System.out.println(sboard_vo.getSb_content());
		System.out.println(sboard_vo.getSb_picture());
		System.out.println(sboard_vo.getSb_writeday());
	
		return "redirect:/crew/sboard_detail?cno="+cno+"&sb_no="+sb_no;
	}
	
	/*---------------------------------------------------------------------------------------*/
	
	@RequestMapping(value="/checkMid", method=RequestMethod.POST)
	public @ResponseBody Object checkMid(@ModelAttribute("mid") String mid)throws Exception{
		List<CrewVO> resultVO = crew_service.memberCrewList(mid);
		System.out.println("========================++++checkMid+++++++++++=============================");
		System.out.println(resultVO);
		return resultVO;
		
	}
		
	/*---------------------------------------------------------------------------------------*/
	
	
	
	///////////////////////// 정림
	
	///////////////////////// 명재
	@Transactional
	@RequestMapping(value="/tab_chat")
	public void sChat_GET(@RequestParam("cno")int cno,Model model) throws Exception {
		List<ChattingVO> list = ch_service.msg_list(cno);
		List<String> mid_list=ch_service.msg_member(cno);
		int size=mid_list.size();
		model.addAttribute("cno", cno);
		model.addAttribute("list", list);
		model.addAttribute("mid_list", mid_list);
		model.addAttribute("size", size);
	}
	@ResponseBody
	@RequestMapping(value="/tab_chat/{cno}")
	public List<ChattingVO> send_Chat(@PathVariable("cno")int cno ,Model model) throws Exception {
		List<ChattingVO> list = ch_service.msg_list(cno);
		model.addAttribute("cno", cno);
		model.addAttribute("list", list);
		return list;
	}
	@ResponseBody
	@RequestMapping(value="/tab_chat", method=RequestMethod.POST)
	public String sChat_POST(ChattingVO chat_vo) throws Exception {
		ch_service.insert_msg(chat_vo);
		
		return "redirect:/crew/tab_chat";
	} 
	
	
	@RequestMapping(value="/tab_list") 
	public void slist(@RequestParam("cno") int cno ,Model model) throws Exception {
		
		//소모임 대문 사진 가져오기
		CrewVO crewVO=crew_service.crew_tab_list(cno);

		List<sListVO> sList_list=sList_service.slist_tab_list(cno);
		List<MemberVO> member_list=member_service.member_tab_list(cno);
		List<StatusVO> status = sList_service.join_sList_member(cno);
			for(sListVO list: sList_list){
				String str1=list.getAttend_date().substring(0, 4)+"년";
				String str2=list.getAttend_date().substring(4, 6)+"월";
				String str3=list.getAttend_date().substring(6, 8)+"일";
				String str4=list.getAttend_date().substring(8, 10)+":";
				String str5=list.getAttend_date().substring(10);
				String str = str1+str2+str3+str4+str5;
				list.setAttend_date(str);
			}	// 정모 날자 잘라서 년월일 : 붙여주는 코드
		model.addAttribute("status", status);
		model.addAttribute("crewVO", crewVO);
		model.addAttribute("sList_list", sList_list);
		model.addAttribute("member_list", member_list);
	}
	
	// 조회수 증가 방지 - 쿠키 이용
	   @RequestMapping("bread")
	   public String newRead(HttpServletRequest request, HttpServletResponse response,@RequestParam int cno, RedirectAttributes rttr) throws Exception {
	      Cookie[] cookies = request.getCookies();
	      Cookie cookie = null;
	      
	      if(cookies!=null && cookies.length>0) {
	         System.out.println("cookies[]");
	         
	         for(int i=0; i<cookies.length; i++) {
	            if(cookies[i].getName().equals("cookie")) {
	               cookie = cookies[i];
	            }
	         }
	      }
	      
	      if(cookie == null) {
	         cookie = new Cookie("cookie", "|"+ cno +"|");
	         response.addCookie(cookie);
	         crew_service.update_crew_cnt(cno);
	      } else {
	         String value = cookie.getValue();
	         if(value.indexOf("|"+ cno +"|")<0) {
	            value = value + "|"+ cno +"|";
	            cookie.setValue(value);
	            response.addCookie(cookie);
	            crew_service.update_crew_cnt(cno);
	         }
	      }
	      System.out.println("#############################################");
	      System.out.println(cookies);
	      System.out.println(cookie);
	      rttr.addAttribute("cno", cno);
	      
	      return "redirect:/crew/tab_list?cno="+cno;
	   }
	
	@ResponseBody
	@RequestMapping(value="/update_Role")	//소모임의 운영자 권한 주기
	public void update_MemberPower(@RequestParam("cno") int cno,String mid)throws Exception{
		crew_service.crew_update_role(cno, mid);
	}
	@ResponseBody
	@RequestMapping(value="/delete_Role")	//소모임의 운영자 권한 해지
	public void delete_MemberPower(int cno)throws Exception{
		crew_service.crew_delete_role(cno);
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping(value="/update_s_join_cnt") //정모 참석 누르기
	public void update_MemberPower(int sl_no,int cno,String mid)throws Exception{
		sList_service.update_s_join_cnt(sl_no);
		sList_service.join_sList_insert(cno, sl_no, mid);
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping(value="/delete_slist_member")
	public void slist_update_member(int sl_no, String mid)throws Exception{
		sList_service.delete_slist_member(sl_no, mid);
		sList_service.update_slist_member(sl_no);
	}
	
	@RequestMapping(value="/join_Crew")
	public String join_Crewo(@RequestParam("cno") int cno,@RequestParam("mid") String mid)throws Exception{
		crew_service.join_Crew(cno, mid);
		return "redirect:/crew/tab_list?cno="+cno;
	}
	
	///////////////////////// 진희
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void crew_list(@ModelAttribute("cri") Criteria cri, Model model, String mid, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		mid = memberVO.getMid();

		List<CrewVO> list = crew_service.crew_list(cri, mid);
		model.addAttribute("list", list);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/list_sList/{cno}")
	public sListVO crew_sList(@PathVariable("cno")int cno, Model model)throws Exception{
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
	
	// 모임멤버 강퇴 & 소모임 탈퇴
@ResponseBody
	@RequestMapping(value="/delete_crewMember")
	public void delete_crewMember(int cno, String mid)throws Exception{
		crew_service.delete_crewMember(cno, mid);
	}
	
	// 소모임 멤버 상세보기
	@RequestMapping(value="/memberDetail")
	public void memberDetail(@RequestParam("cno") int cno, @RequestParam("mid") String mid, Model model)throws Exception{
		MemberVO memberVo = crew_service.memberDetail(mid);
		List<CrewVO> memberCrewList = crew_service.memberCrewList(mid);
		
		String birthDay = memberVo.getBirth();
		String year = birthDay.substring(0, 4);
		String month = birthDay.substring(4, 6);
		String day = birthDay.substring(6, 8);
		birthDay = year + "/" + month + "/" + day;
		memberVo.setBirth(birthDay);
		
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("memberCrewList", memberCrewList);
		model.addAttribute("cno", cno);
	}
	
	///////////////////////// 현근
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public void crew_createGet() throws Exception {
		
		
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String crew_createPost(String mid, CrewVO crew_vo,  HttpServletRequest request) throws Exception {
	
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		
		mid = memberVO.getMid(); 

		crew_service.crew_create(crew_vo);
		int cno = crew_service.getCno();

		crew_vo.setMid(mid);
		crew_vo.setCno(cno);
		
		return "redirect:/crew/tab_list?cno="+cno;
	}
}
