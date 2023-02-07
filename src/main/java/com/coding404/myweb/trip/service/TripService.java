package com.coding404.myweb.trip.service;

import java.util.ArrayList;

import com.coding404.myweb.command.TripVO;

public interface TripService {
	
	public int noticeRegist(TripVO vo);
	public ArrayList<TripVO> getList();
}
