<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ▼ format & parse 가능한 라이브러리  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- ▼ 리스트 길이를 구하기 위한 fn -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<div id="container">
		<!-- location_area -->
		<div class="location_area customer">
			<div class="box_inner">
				<h2 class="tit_page">TOURIST <span class="in">in</span> TOUR</h2>
				<p class="location">고객센터 <span class="path">/</span> 공지사항</p>
				<ul class="page_menu clear">
					<li><a href="#" class="on">공지사항</a></li>
					<li><a href="#">문의하기</a></li>
				</ul>
			</div>
		</div>	
		<!-- //location_area -->

		<!-- bodytext_area -->
		
		<!-- 
			삭제시는 post로 동작하는데
			hidden 이용해서 삭제에 필요한 키값을 전달해줍니다.
			js를 이용해서 form을 전송
		-->
		<!-- 1. post 방식으로 보내주기 위해 form태그 만들고 -->
		<form action="deleteForm" method="post" name="actionForm">
		<!-- 2. input 태그안에 tno넣어서 보내기(tno만 담음) -->
		<input type="hidden" name="tno" value="${vo.tno }"/>
		
		<div class="bodytext_area box_inner">			
			<ul class="bbsview_list">
				<li class="bbs_title">${vo.title}</li>
				<li class="bbs_hit">작성일 : <span><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></span></li>
				<li class="bbs_date">작성자 : <span>${vo.writer}</span></li>
				<li class="bbs_content">
					<div class="editer_content">
					    ${vo.content}
                    </div>
				</li>
			</ul>
			<p class="btn_line txt_right">
				<a href="notice_modify?tno=${vo.tno}" class="btn_bbs">글수정</a> <!-- 수정도 원래는 post방식 써야함 -->
				<a href="javascript:;" class="btn_bbs" onclick="noticeDelete()">글삭제</a>
				<a href="notice_list" class="btn_bbs">목록</a>
			</p>
			<ul class="near_list mt20">
			
				<!-- ${list } 잘 넘어오는지 확인 -->
				<!-- 
					리스트 길이 확인
					1. 글이 2개인 경우 - 이전글 < 현재글인 경우 이전글
					2. 글이 1개인 경우 - 리스트 길이가 1이고, 글 < 현재글인 경우 다음글이 없음
					3. 글이 0개인 경우 - list길이가 없으면 돌지도 않을거임, 따로 안해도 됨
				 -->
				
				<c:forEach var="data" items="${list }"> <!-- list길이가 없으면 돌지도 않을거임, data에는 이전글 다음글이 들어있음 -->
					<c:if test="${fn:length(list) == 1 and data.tno < vo.tno}">
						<li><h4 class="prev">다음글</h4>은 없습니다</li>
					</c:if>
				
					<c:if test="${data.tno > vo.tno}">
						<li><h4 class="prev">다음글</h4><a href="notice_view?tno=${data.tno }">${data.title }</a></li>
					</c:if>
					<c:if test="${data.tno < vo.tno }">
						<li><h4 class="next">이전글</h4><a href="notice_view?tno=${data.tno }">${data.title }</a></li>
					</c:if>
					
					<c:if test="${fn:length(list) == 1 and data.tno > vo.tno}">
						<li><h4 class="next">이전글</h4>은 없습니다</li>
					</c:if>
				</c:forEach>
			
				<!-- 
				<li><h4 class="prev">다음글</h4><a href="javascript:;">추석 연휴 티켓/투어 배송 및 직접 수령 안내</a></li>		
				<li><h4 class="next">이전글</h4><a href="javascript:;">이번 여름 휴가 제주 갈까? 미션 투어 (여행경비 50만원 지원)</a></li>
				 -->
			</ul>
		</div>
		</form>
		<!-- //bodytext_area -->

	</div>
	<!-- //container -->
	
	<script>
		function noticeDelete() {
		//a링크 고유이벤트 중지
			event.preventDefault();
			
			if(confirm("정말 지웁니까?")) {
				//폼 형식으로 삭제 - document.form이름
				document.actionForm.submit();
			}
		}
	</script>
	
