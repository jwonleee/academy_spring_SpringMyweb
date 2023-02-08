package com.coding404.myweb;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.coding404.myweb.command.TripVO;
import com.coding404.myweb.trip.service.TripMapper;

@RunWith(SpringJUnit4ClassRunner.class) //junit으로 테스트환경을 구성
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/root-context.xml") //동작시킬 스프링 설정 파일 - 전체 풀 경로
public class PageTest {

	@Autowired
	TripMapper tripMapper;
	
//	테스트 코드로 반복문 돌려서 DB에 넣기
//	@Test
//	public void testCode() {
//		
//		for(int i = 1; i <= 300; i++) {
//		TripVO vo = new TripVO(0, "2023-02-08", "admin"+i, "test"+i, "example"+i, 0, null);
//		tripMapper.noticeRegist(vo);
//		}
//	}
	
	
	
}
