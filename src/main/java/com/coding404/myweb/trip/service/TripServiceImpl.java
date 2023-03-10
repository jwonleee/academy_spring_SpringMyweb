package com.coding404.myweb.trip.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding404.myweb.command.TripVO;
import com.coding404.myweb.util.Criteria;

@Service("tripService") //이거 다시 확인
public class TripServiceImpl implements TripService{

	@Autowired
	private TripMapper tripMapper;

	@Override
	public int noticeRegist(TripVO vo) {
		//별다른 작업이 없어서 리턴에 실음
		return tripMapper.noticeRegist(vo);
	}

	@Override
	public ArrayList<TripVO> getList(Criteria cri) {
		return tripMapper.getList(cri);
	}
//	페이지네이션에 필요한 전체게시글 수
	@Override
	public int getTotal(Criteria cri) {
		return tripMapper.getTotal(cri);
	}

	@Override
	public TripVO getContent(int tno) {
		return tripMapper.getContent(tno);
	}

	@Override
	public int noticeModify(TripVO vo) {
		return tripMapper.noticeModify(vo);
	}

	@Override
	public int noticeDelete(int tno) {
		return tripMapper.noticeDelete(tno);
	}

	@Override
	public void upHit(int tno) {		
		tripMapper.upHit(tno);
	}

	@Override
	public ArrayList<TripVO> getPrevNext(int tno) {

		return tripMapper.getPrevNext(tno);
	}

	
	
	
	
	
	
	
	
	
	
}
