<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/swiper.min.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
		var swiper = new Swiper('.swiper-container', {
			loop: true,
			autoplay:5500,
		    autoplayDisableOnInteraction: false,
			pagination: '.swiper-pagination',
            paginationClickable: true
		});
	});
</script>

	<!-- header 있던 자리 -->
	<!-- resources - layout 폴더에 header 따로 빼 주고 연결, 여기서는 상대경로만 가능, 별로 추천 안함... 폴더 지워버림ㅋㅋ -->
	<%-- <%@ include file = "../../resources/layout/header.jsp" %> --%>
	
	<div id="container">
        <div class="main_rolling_pc">
            <div class="visualRoll">
                <ul class="viewImgList">
                    <li class="imglist0">
                        <div class="roll_content">
                            <a href="javascript:;">
                            <img src="${pageContext.request.contextPath }/resources/img/img_slidecontents01.png" alt="TRUST & INFORMATION 믿을 수 있는 여행정보, 여행... 어디로 가세요?"></a>
                            <p class="roll_txtline">BE TOURIST FOR BETTER LIFE</p>
                        </div>
                    </li>
                    <li class="imglist1">
                        <div class="roll_content">
                            <a href="javascript:;">
                            <img src="${pageContext.request.contextPath }/resources/img/img_slidecontents02.png" alt="TRUST & INFORMATION 믿을 수 있는 여행정보, 여행... 어디로 가세요?"></a>
                            <p class="roll_txtline">BE TOURIST FOR BETTER LIFE</p>
                        </div>
                    </li>
                    <li class="imglist2">
                        <div class="roll_content">
                            <a href="javascript:;">
                            <img src="${pageContext.request.contextPath }/resources/img/img_slidecontents03.png" alt="TRUST & INFORMATION 믿을 수 있는 여행정보, 여행... 어디로 가세요?"></a>
                            <p class="roll_txtline">BE TOURIST FOR BETTER LIFE</p>
                        </div>
                    </li>
                </ul>

                <div class="rollbtnArea">
                    <ul class="rollingbtn">
                        <li class="seq butt0"><a href="#butt"><img src="${pageContext.request.contextPath }/resources/img/btn_rollbutt_on.png" alt="1번" /></a></li>
                        <li class="seq butt1"><a href="#butt"><img src="${pageContext.request.contextPath }/resources/img/btn_rollbutt_off.png" alt="2번" /></a></li>
                        <li class="seq butt2"><a href="#butt"><img src="${pageContext.request.contextPath }/resources/img/btn_rollbutt_off.png" alt="3번" /></a></li>
                        <li class="rollstop"><a href="#" class="stop"><img src="${pageContext.request.contextPath }/resources/img/btn_roll_stop.png" alt="멈춤" /></a></li>
                        <li class="rollplay"><a href="#" class="play"><img src="${pageContext.request.contextPath }/resources/img/btn_roll_play.png" alt="재생" /></a></li>
                    </ul>
                </div><!-- //rollbtnArea -->

            </div><!-- //visualRoll -->
        </div><!-- //main_rolling_pc -->
        
        <div class="main_rolling_mobile">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="javascript:;"><img src="${pageContext.request.contextPath }/resources/img/mainslide_mob01.jpg" alt="TRUST & INFORMATION 믿을 수 있는 여행정보, 여행... 어디로 가세요?" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="javascript:;"><img src="${pageContext.request.contextPath }/resources/img/mainslide_mob02.jpg" alt="TRUST & INFORMATION 믿을 수 있는 여행정보, 여행... 어디로 가세요?" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="javascript:;"><img src="${pageContext.request.contextPath }/resources/img/mainslide_mob03.jpg" alt="TRUST & INFORMATION 믿을 수 있는 여행정보, 여행... 어디로 가세요?" /></a>
                    </div>
                </div>						
                <div class="swiper-pagination"></div>
                <!-- <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div> -->
                
            </div><!--//swiper-container-->
        </div><!--//main_rolling_mobile -->
	
		<!-- about_area -->
		<div class="about_area">
			<h2>다시 찾는 인기 여행지 <b>TOP 3</b></h2>
			<div class="about_box">
				<ul class="place_list box_inner clear">
					<li><a href="#" onclick="$('.popup_base').css('height',$(document).height());$('.contact_pop').show();">
							<img class="img_topplace" src="${pageContext.request.contextPath }/resources/img/img_topplace01.jpg" alt="다리를 높이 들어 운동" />
							<h3>성패트릭 대성당</h3>
							<p class="txt">바쁜 뉴욕 안에서 정교하면서도 웅장한 기운에 침묵하게 되는 기도의 시간!</p>
							<span class="view">VIEW</span></a>
					</li>
					<li><a href="#" onclick="$('.popup_base').css('height',$(document).height());$('.space_pop').show();">
							<img class="img_topplace" src="${pageContext.request.contextPath }/resources/img/img_topplace02.jpg" alt="바닷가에서 스트레칭" />
							<h3>원주 뮤지엄 '산'</h3>
							<p class="txt">전시된 유산들을 담아낸 건물에 신비로운 돌과 물의 테마가 담겨 있다.</p>
							<span class="view">VIEW</span></a>
					</li>
					<li><a href="#" onclick="$('.popup_base').css('height',$(document).height());$('.program_pop').show();">
							<img class="img_topplace" src="${pageContext.request.contextPath }/resources/img/img_topplace03.jpg" alt="앉아서 스트레칭" />
							<h3>일본 만국박람회 기념공원</h3>
							<p class="txt">오사카 센리 반파쿠에는 드넓은 대지에 정원과 들, 물과 함께 하는 문화가 있다.</p>
							<span class="view">VIEW</span></a>
					</li>
				</ul>
			</div>
		</div>
		<!-- //about_area -->

		<!-- app_area -->
		<div class="appbbs_area">
			<div class="appbbs_box box_inner clear">
				<h2 class="hdd">상담과 최근게시물</h2>
				<p class="app_line">
					<a href="javascript:;">카카오톡 1:1 상담</a>
					<a href="javascript:;">전화 상담 신청</a>
				</p>
				<div class="bbs_line">
					<h3>NOTICE</h3>
					<ul class="notice_recent">
						<li><a href="javascript:;">이번 여름 휴가 제주 갈까? 미션 투어 (여행경비 50만원 지원)</a></li>
						<li><a href="javascript:;">박물관 미션 투어 응모 당첨자 발표</a></li>
						<li><a href="javascript:;">추석 연휴 티켓/투어 배송 및 직접 수령 안내</a></li>
						<li><a href="javascript:;">하롱베이 서비스 OPEN! (여행정보, 가이드북, 가이드맵)</a></li>
						<li><a href="javascript:;">투어리스트인투어 서비스 점검 안내</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- //app_area -->


	<!-- footer 있던 자리 -->

	<!-- sidebar 있던 자리 ▶ left.jsp로 감 -->


    