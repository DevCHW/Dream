<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
%>

  <%--header 호출 --%>
  <jsp:include page="/WEB-INF/view/header.jsp" />
  
  <%--직접 만든 CSS --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/join.css" />
  
   <%-- 직접만든 javascript --%>
  <script type="text/javascript" src="<%= ctxPath%>/js/join.js" ></script>
  
  
    <div id="Main" class="">
      <div class="login_form">
        <div class="title d-flex justify-content-center align-items-center pt-5">
          <h4 class="title">회원가입</h4>
        </div>
        <div class="Main d-flex flex-column w-100">
          <form action="joinFrm">
            <fieldset>
              <%-- userid --%>
              <div id="userid" class="login_input d-flex flex-column">
                <label for="userid">이메일 주소<span id="login_label_ettential">필수입력</span></label>
                <input type="text" id="userid" name="userid" placeholder="예) example@email.co.kr">
                <p id="userid_error" class="login_error">아이디는 필수정보 입니다.</p>
              </div>

              <%-- passwd --%>
              <div id="passwd" class="login_input d-flex flex-column">
                <label for="passwd">비밀번호<span id="login_label_ettential">필수입력</span></label>
                <input type="password" name="passwd" placeholder="영문, 숫자, 특수문자를 조합 (8-16자)" id="passwd">
                <p id="passwd_error" class="login_error">영문, 숫자, 특수문자를 조합하여 입력해주세요. (8-16자)</p>
                
                <label for="passwd_check">비밀번호 확인<span id="login_label_ettential">필수입력</span></label>
                <input type="password" name="passwd_check" placeholder="비밀번호 확인">
                <p id="passwd_check_error" class="login_error">비밀번호가 일치하지 않습니다.</p>
              </div>

              
              <%-- agreement --%>
              <div class="login_agreement d-flex flex-column mt-5">
                <div class="login_checkbox d-flex justify-content-between">
                  <div>
                    <input type="checkbox" id="agree_age" name="agree_age"/></input>
                    <label for="agree_age">[필수] 만 14세 이상이며 모두 동의합니다.</label>
                  </div>
                  <a type="button" onclick="">자세히</a>
                </div>

                <div class="login_checkbox d-flex justify-content-between">
                  <div>
                    <input type="checkbox" id="agree_message" name="agree_message"/>
                    <label for="agree_message">[선택] 광고성 정보 수신에 모두 동의합니다.</label>
                  </div>
                  <a type="button" onclick="">자세히</a>
                </div>
              </div>
            </fieldset>
            <button id="btn_join" type="submit" class="mt-4">가입하기</button>
          </form>
        </div>
      </div>
    </div>
    
    
    
<%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />