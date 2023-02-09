package com.coding404.myweb.util;

import lombok.Data;

//sql문에 페이지번호, 데이터개수 전달해 줄 클래스
@Data //getter, setter
public class Criteria {
	
	private int page; //페이지번호
	private int amount; //데이터개수
	
	private String searchType; //검색타입 = 제목, 내용, 작성자, 제목+내용
	private String searchName; //검색값
	
	//초기값 설정해주기 위해서 생성자는 lombok 사용x
	public Criteria() {
		this.page = 1;
		this.amount = 10;
	}

	//생성자 생성
	public Criteria(int page, int amount) {
		super();
		this.page = page;
		this.amount = amount;
	}
	
	//limit 함수의 페이지 시작 부분에 들어갈 pageStart getter ▶ TripMapper.xml에서 사용 
	public int getPageStart() {
		return (page - 1) * amount;
	}
	
	
}
