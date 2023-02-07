package com.coding404.myweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coding404.myweb.command.TripVO;
import com.coding404.myweb.trip.service.TripService;

@Controller
@RequestMapping("/trip")
public class NoticeController {
	
	@Autowired
	@Qualifier("tripService")
	private TripService tripService;
	
	
	//화면 구현 - 컨트롤러 연결
	@RequestMapping("/notice_list")
	public String notice_list() {
		
		/*
		 * service, mapper 영역에 getList 함수를 선언하고
		 * 등록번호 역순으로 데이터를 조회해서 가지고 나옵니다.
		 * model에 담아서
		 * 화면에서는 반복문으로 처리.
		 */
		
		return "trip/notice_list";
	}
	
	@RequestMapping("/notice_view")
	public String notice_view() {
		
		return "trip/notice_view";
	}
	
	@RequestMapping("/notice_write")
	public String notice_write() {
		
		return "trip/notice_write";
	}
	
	@RequestMapping("/notice_modify")
	public String notice_modify() {
		
		return "trip/notice_modify";
	}
	
	//글등록
	@RequestMapping(value="/registForm", method=RequestMethod.POST)
	public String registForm(TripVO vo, RedirectAttributes ra) {
		System.out.println(vo.toString());
		
		int result = tripService.noticeRegist(vo);
		String msg = result == 1 ? "문의사항이 정상 등록되었습니다" : "문의 등록에 실패했습니다";
		ra.addFlashAttribute("msg", msg);
		
		return "redirect:/trip/notice_list"; //데이터 받으면 목록화면으로 그냥 넘기기
	}

}
