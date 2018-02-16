package kr.co.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.sListVO;
import kr.co.service.sListService;

@Controller
@RequestMapping("/sList")
public class sListController {
	
	@Inject
	private sListService sList_service;
	
	@RequestMapping(value="/slist_create", method=RequestMethod.GET)
	public void slist_createGet(@RequestParam("cno") int cno, Model model) throws Exception {
		model.addAttribute("cno", cno);
	}
	
	@RequestMapping(value="/slist_create", method=RequestMethod.POST)
	public String slist_createPost(sListVO slistVo, @RequestParam("cno") int cno, RedirectAttributes rttr) throws Exception {
		sList_service.slist_create(slistVo);
		return "redirect:/crew/tab_list?cno="+cno;
	}
	
	@RequestMapping(value="/slist_update", method=RequestMethod.GET)
	public void slist_updateGet(@RequestParam("sl_no") int sl_no, Model model) throws Exception {
		sListVO slistVo = sList_service.slistBySlno(sl_no);
		model.addAttribute("slistVo", slistVo);
	}
	
	@RequestMapping(value="/slist_update", method=RequestMethod.POST)
	public String slist_updatePost(sListVO slistVo) throws Exception {
		sList_service.slist_update(slistVo);
		int cno = slistVo.getCno();
		return "redirect:/crew/tab_list?cno="+cno;
	}
	
	@RequestMapping(value="/slist_delete", method=RequestMethod.POST)
	public String slist_delete(@RequestParam("sl_no") int sl_no, @RequestParam("cno") int cno) throws Exception {
		sList_service.slist_delete(sl_no);
		
		return "redirect:/crew/tab_list?cno="+cno;
	}
	
}
