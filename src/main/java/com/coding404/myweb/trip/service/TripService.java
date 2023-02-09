package com.coding404.myweb.trip.service;

import java.util.ArrayList;

import com.coding404.myweb.command.TripVO;
import com.coding404.myweb.util.Criteria;

public interface TripService {
	
	public int noticeRegist(TripVO vo); //등록
//	public ArrayList<TripVO> getList(); //조회
	public ArrayList<TripVO> getList(Criteria cri); //페이지
	public int getTotal(Criteria cri); //전체게시글수
	
	public TripVO getContent(int tno);  //상세조회
	public int noticeModify(TripVO vo); //수정 - 성공실패 int로, 수정된 값 받아야 하니까 TripVO
	public int noticeDelete(int tno); //삭제
	
	public void upHit(int tno); //조회수
	public ArrayList<TripVO> getPrevNext(int tno);
}
