<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ▼ home.jsp에서 가져옴, jstl 사용하려고 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- ▼ format & parse 가능한 라이브러리  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


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
		<div class="bodytext_area box_inner">
			<form action="#" class="minisrch_form">
				
				<fieldset>
					<select name="###" style="height: 35px;">
						<option value="#">제목</option>
						<option value="#">내용</option>
						<option value="#">작성자</option>
						<option value="#">제목+내용</option>
					</select>
					<legend>검색</legend>
					<input type="text" class="tbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요">
					<a href="javascript:;" class="btn_srch">검색</a>
				</fieldset>
			</form>
			<table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
				<caption class="hdd">공지사항  목록</caption>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="board" items="${list }" varStatus="num">
					<tr>
						<%-- <td>${num.count }</td> 이거 안써도 됨 --%>
						<td>${board.tno }</td>
						<td class="tit_notice"><a href="notice_view?tno=${board.tno }">${board.title }</a> </td>
						<td>${board.hit }</td>
						<td><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd"/></td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<!-- pagination -->
			<div class="pagination">
				<a href="javascript:;" class="firstpage  pbtn"><img src="${pageContext.request.contextPath }/resources/img/btn_firstpage.png" alt="첫 페이지로 이동"></a>
				<a href="javascript:;" class="prevpage  pbtn"><img src="${pageContext.request.contextPath }/resources/img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
				<a href="javascript:;"><span class="pagenum currentpage">1</span></a>
				<a href="javascript:;"><span class="pagenum">2</span></a>
				<a href="javascript:;"><span class="pagenum">3</span></a>
				<a href="javascript:;"><span class="pagenum">4</span></a>
				<a href="javascript:;"><span class="pagenum">5</span></a>
				<a href="javascript:;" class="nextpage  pbtn"><img src="${pageContext.request.contextPath }/resources/img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
				<a href="javascript:;" class="lastpage  pbtn"><img src="${pageContext.request.contextPath }/resources/img/btn_lastpage.png" alt="마지막 페이지로 이동"></a>
			</div>
			<!-- //pagination -->
			
		</div>
		<!-- //bodytext_area -->

	</div>
	<!-- //container -->
	
	<!-- 화면에서 msg받아서 alert로 나타냄 -->
	<script>
		var msg = '${msg}'; //글 등록되면 msg변수를 여기로 가져와서 msg 변수에 넣음
		if(msg != '') { //msg가 공백이 아니라면 알림창 띄움
			alert(msg);
		}
	</script>

