<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	
    <!-- 데이트피커 -->
    <!-- 이 화면에서만 사용되는 달력이므로 지우면 안됨 -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
    $( function() {
        $( "#datepicker_a" ).datepicker({
        	dateFormat: 'yy-mm-dd',
        	editable: true
        });
        
    });
    </script>


	<div id="container">
		<!-- location_area -->
		<div class="location_area customer">
			<div class="box_inner">
				<h2 class="tit_page">TOURIST <span class="in">in</span> TOUR</h2>
				<p class="location">고객센터 <span class="path">/</span> 공지사항</p>
				<ul class="page_menu clear">
					<li><a href="#" class="on">공지사항</a></li>
					<li><a href="#">문의내용 수정</a></li>
				</ul>
			</div>
		</div>	
		
		<div class="bodytext_area box_inner">
			<!-- appForm -->
			<form action="######" method="post" class="appForm">
				<fieldset>
					<legend>상담문의 수정양식</legend>
					<p class="info_pilsoo pilsoo_item">필수입력</p>
					<ul class="app_list">
                        <li class="clear">
                            <label for="email_lbl" class="tit_lbl pilsoo_item">등록일 (수정 일자)</label>
                            <div class="app_content email_area">
                            	<!-- required, pattern속성을 사용할 떄는 form태그를 반드시 submit버튼으로 전송해야 동작됩니다. -->
                                <input type="text" name="####" value="2022-02-03" id="datepicker_a" placeholder="날짜를 선택하세요" required="required" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" >
                            </div>
						</li>
						
						<li class="clear">
                            <label for="email_lbl" class="tit_lbl pilsoo_item">작성자 (수정 불가)</label>
                            <div class="app_content email_area">
								<input type="hidden" />
                                <input type="text" name="####" placeholder="작성자" readonly="readonly"/>

                            </div>
						</li>
						<li class="clear">
							<label for="name_lbl" class="tit_lbl pilsoo_item">제목</label>
							<div class="app_content">
								<input type="text" name="####" class="w100p" id="name_lbl" placeholder="제목을 입력하세요" required="required"/>
							</div>
						</li>


						<li class="clear">
							<label for="content_lbl" class="tit_lbl">문의내용</label>
							<div class="app_content">
							<textarea name="####" id="content_lbl" class="w100p"></textarea>
							</div>
						</li>
					</ul>
					<p class="btn_line">

						<input type="submit" class="btn_baseColor" value="글 수정">
						<input type="button" class="btn_baseColor" value="목록">

                    </p>	
				</fieldset>
			</form>
		</div>
	</div>
	<!-- //container -->
	
