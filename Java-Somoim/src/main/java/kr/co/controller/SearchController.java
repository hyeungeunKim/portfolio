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
import kr.co.domain.MemberVO;
import kr.co.service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Inject
	private SearchService search_service;
	
	@RequestMapping(value="search", method=RequestMethod.GET)
	public void search(@ModelAttribute("cri") Criteria cri) throws Exception {
		
		System.out.println("searchCategory... path:search/search.jsp");
	}
	
	@RequestMapping(value="/searchCrew")
	public void searchCrew(@ModelAttribute("cri") Criteria cri, Model model, @RequestParam("searchType") String searchType, @RequestParam("keyword") String keyword, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		String mid = memberVO.getMid();
		
		System.out.println("################################");
		System.out.println("searchType :: " + searchType);
		System.out.println("keyword :: " + keyword);
		System.out.println("################################");
		List<CrewVO> searchCrewList = search_service.searchCrew(cri, mid, searchType, keyword);
		model.addAttribute("searchCrewList", searchCrewList);
	}
	
}
