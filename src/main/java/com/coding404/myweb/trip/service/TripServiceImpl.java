package com.coding404.myweb.trip.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding404.myweb.command.TripVO;

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
	public ArrayList<TripVO> getList() {
		
		return tripMapper.getList();
	}
	
	
	
}
