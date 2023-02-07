package com.coding404.myweb.trip.service;

import org.apache.ibatis.annotations.Mapper;

import com.coding404.myweb.command.TripVO;

@Mapper
public interface TripMapper {

	public int noticeRegist(TripVO vo);
	
}
