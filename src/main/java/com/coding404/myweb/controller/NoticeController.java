package com.coding404.myweb.controller;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coding404.myweb.command.TripVO;
import com.coding404.myweb.trip.service.TripService;
import com.coding404.myweb.util.Criteria;
import com.coding404.myweb.util.PageVO;

@Controller
@RequestMapping("/trip")
public class NoticeController {
	
	@Autowired
	@Qualifier("tripService")
	private TripService tripService;
	
	
	//화면 구현 - 컨트롤러 연결
	@RequestMapping("/notice_list")
	public String notice_list(Criteria cri, Model model) {
		
		/*
		 * service, mapper 영역에 getList 함수를 선언하고
		 * 등록번호 역순으로 데이터를 조회해서 가지고 나옵니다.
		 * model에 담아서 (여기서 모델에 담아줘야 함)
		 * 화면에서는 반복문으로 처리.
		 */
		//데이터
		//ArrayList<TripVO> list = tripService.getList(cri);
		
		//페이지네이션
		//int total = tripService.getTotal();
		//PageVO pageVO = new PageVO(cri, total);	
		//System.out.println(pageVO.toString()); //확인
		
		//페이지 검색처리
		/*
		 * 1. 화면에서는 page, amount, searchType, searchName을 넘긴다.
		 * 2. criteria에서 검색값을 받는다.
		 * 3. sql문을 바꾼다 (동적쿼리)
		 * 4. total sql도 바꾼다 (동적쿼리)
		 * 5. 페이지 a태그 클릭시 searchType, searchName을 쿼리스트링으로 넘긴다.
		 * 6. 검색 키워드 유지
		 */
		
		System.out.println(cri.toString());
		
		ArrayList<TripVO> list = tripService.getList(cri);
		
		int total = tripService.getTotal(cri);
		
		PageVO pageVO = new PageVO(cri, total);
		
		
		
		model.addAttribute("list", list); //model객체에 addAttribute로 리스트를 list라는 이름으로 담음
		model.addAttribute("pageVO",pageVO);
		
		return "trip/notice_list";
	}
	
	//상세화면
	@RequestMapping("/notice_view")
	public String notice_view(@RequestParam("tno") int tno,
							  Model model,
							  HttpServletResponse response,
							  HttpServletRequest request) {
		//클릭한 글 번호에 대한 내용을 조회 
		TripVO vo = tripService.getContent(tno);
		//System.out.println(vo.toString()); 확인
		//화면에 뿌려주려고 Model에 실어서 보내기
		model.addAttribute("vo",vo);
		
		//조회수 - Cookie or session 이용해서 조회수 중복방지(구현 안함)
		tripService.upHit(tno);
		
//		Cookie cookie = new Cookie("key", "aaa");
//		cookie.setMaxAge(60); //쿠키 가용시간 60초
//		response.addCookie(cookie);
//		request.getCookie(); 로 가져와서 쓰기
		
		//이전글 다음글
		ArrayList<TripVO> list = tripService.getPrevNext(tno);
		System.out.println(list.toString());
		model.addAttribute("list", list);
		
		return "trip/notice_view";
	}
	
	//글 작성
	@RequestMapping("/notice_write")
	public String notice_write() {
		
		return "trip/notice_write";
	}
	
	//수정화면
	@RequestMapping("/notice_modify")
	public String notice_modify(@RequestParam("tno") int tno,
								Model model) {
		
		TripVO vo = tripService.getContent(tno);
		model.addAttribute("vo",vo);
		
		return "trip/notice_modify";
	}
	
	//글 등록
	@RequestMapping(value="/registForm", method=RequestMethod.POST)
	public String registForm(TripVO vo, RedirectAttributes ra) {
		System.out.println(vo.toString());
		
		int result = tripService.noticeRegist(vo);
		String msg = result == 1 ? "문의사항이 정상 등록되었습니다" : "문의 등록에 실패했습니다";
		ra.addFlashAttribute("msg", msg);
		
		return "redirect:/trip/notice_list"; //데이터 받으면 목록화면으로 그냥 넘기기
	}
	
	//글 수정
	@RequestMapping(value="/modifyForm", method=RequestMethod.POST)
	public String modifyForm(TripVO vo,
							 RedirectAttributes ra) {
		
		//업데이트 작업 - 화면에서는 tno가 필요하기 때문에 hidden태그를 이용해서 넘겨주세요
		System.out.println(vo.toString());
		int result = tripService.noticeModify(vo);
		String msg = result==1 ? "문의사항이 수정되었습니다" : "수정에 실패했습니다";
		ra.addFlashAttribute("msg",msg);
		
		return "redirect:/trip/notice_list"; //목록으로 가려면 redirect만 해주면 됨
//		return "redirect:/trip/notice_view?tno=" + vo.getTno(); //view로 넘기고 싶으면 위로 올라가보면 tno가 있으니까 get방식으로 넘겨줘야함
	}
	
	//글 삭제
	@RequestMapping(value="/deleteForm", method=RequestMethod.POST)
	public String deleteForm(@RequestParam("tno") int tno,
							 RedirectAttributes ra) {
		
		/*
		 * service, mapper에는 noticeDelete 메서드로 삭제를 진행
		 * 삭제 이후에는 list화면으로 이동해주면 됩니다.
		 */
		int result = tripService.noticeDelete(tno);
		
		String msg = result==1? "삭제되었습니다" : "삭제에 실패했습니다";
		ra.addFlashAttribute("msg", msg);
		
		return "redirect:/trip/notice_list";
	}
	
	
	///////////////////////////////////////참고////////////////////////////////////////
	//수정, 상제 화면이 완전 동일하다면
	//void형은 들어오는 경로가 나가는 경로라서 modify경로로 들어오면 modify로, view로 들어오면 view로 나감
//	@RequestMapping({"notice_modify", "notice_view"})
//	public void notice_view(@RequestParam("tno") int tno,
//							Model model) {
//		
//		TripVO vo = tripService.getContent(tno);
//		model.addAttribute("vo",vo);
//	}
	
}
