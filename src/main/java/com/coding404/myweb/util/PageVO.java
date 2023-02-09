package com.coding404.myweb.util;

import lombok.Data;

//화면에 그려지는 페이지네이션의 값을 계산하는 클래스
@Data
public class PageVO {

	private int end; //페이지네이션 끝번호
	private int start; //페이지네이션 시작번호
	private boolean next; //다음버튼 활성화 여부
	private boolean prev; //이전버튼 활성화 여부
	
	private int realEnd; //페이지네이션 실제 끝 번호
	
	private int page; //사용자가 조회하는 페이지번호
	private int amount; //화면 1페이지에 나타나는 데이터개수
	private int total; //전체 게시글 수
	
	private Criteria cri; //페이지 기준 (클래스), 생성자로 생성할 때 넣어줌
	//
	
	private int pageCnt = 5;
	
	//생성자 - pageVO가 만들어질 때 cri, total을 받는다.
	public PageVO(Criteria cri, int total) {
		//계산에 필요한 값(페이지번호, 데이터개수, 전체게시글수, cri)을 초기화
		this.page = cri.getPage(); //Criteria에 있음
		this.amount = cri.getAmount(); //Criteria에 있음
		this.total = total; //매개변수
		this.cri = cri; //매개변수
		
		//1. 끝 페이지 계산
		//page가 1~10 ▶ 끝페이지 10
		//page가 11~20 ▶ 끝페이지 20
		//(int) Math.ceil(페이지번호/10.0) * 페이지네이션 수
		this.end = (int)Math.ceil(this.page / (double)pageCnt) * pageCnt;
		
		//2. 시작페이지 번호 계산
		//end - 페이지네이션 수 + 1
		this.start = this.end - pageCnt + 1; 
		
		//3. 실제 끝번호 계산
		//데이터가 60개라고 가정할 때, end = 6
		//데이터가 112개라고 가정할 때, 11번페이지 조회시 end = 12
		//데이터가 356개라고 가정할 때, 32번페이지 조회시 end = 36
		//(int)Math.ceil(전체게시글수 / 데이터개수), 정수/정수는 정수라 올림이 잘 안일어나므로 하나는 double로 캐스팅
		this.realEnd = (int)Math.ceil(this.total / (double)this.amount);
		
		//4. 마지막 페이지번호를 다시 계산 ▶ 걍 작은거 따라감
		//데이터가 112개라고 가정할 때, 5번 페이지 조회시 end=10, realEnd=12 
		//데이터가 112개라고 가정할 때, 11번페이지 조회시, end=20, realEnd=12
		//끝번호 > 실제끝번호 라면 실제끝번호를 따라감
		this.end = this.end > this.realEnd ? this.realEnd : this.end;
		
		//5. 이전버튼
		//start는 1, 11, 21, 31, ...로 증가되는데 1보다 크면 true
		this.prev = this.start > 1;
		
		//6. 다음버튼
		//조건 - realEnd가 end보다 크면 true
		this.next = realEnd > this.end;

	}
	
}
