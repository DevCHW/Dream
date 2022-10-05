<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
	//
%>
<%-- header 호출 --%>
<jsp:include page="/WEB-INF/view/admin/ad_header.jsp" />

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/admin/productRegister.css" />

<%-- 직접만든 javascript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/admin/productRegister.js" ></script>


<%-- 상품등록페이지 코드 시작 --%>
<div class="container d-flex flex-column mt-4">

<%-- !!!!! ==== 중요 ==== !!!!! --%>
<%-- 폼에서 파일을 업로드 하려면 반드시 method 는 POST 이어야 하고 
     enctype="multipart/form-data" 으로 지정해주어야 한다.!! --%>
     
	<form name="prodInputFrm"
	     class="m-auto"
	     action="<%=ctxPath%>/admin/productRegister.dream"
	     method="post"
	     enctype="multipart/form-data" > <%--  enctype="multipart/form-data" 으로 지정해야 파일이 올라간다. --%>
	     <div id="tableBox" class="border">
		     <table id="tblProdInput">
		      <tbody>
		      	   <%-- 카테고리 --%>
		           <tr>
		             <td width="25%" class="prodInputName" style="padding-top: 10px;">카테고리</td>
		             <td width="75%" align="left" style="padding-top: 10px;" >
		               <select name="category" class="infoData rounded">
		                  <option value="">카테고리</option>
	                      <option value="1">침구류</option>
	                      <option value="2">조명</option>
	                      <option value="3">파자마</option>
		                </select>
		                <span class="error">필수입력</span>   
		             </td>
		           </tr>
		           
		           <%-- 디테일카테고리 --%>
		           <tr>
		             <td width="25%" class="prodInputName" style="padding-top: 10px;">상세카테고리</td>
		             <td width="75%" align="left" style="padding-top: 10px;" >
		               <select name="detail_category" class="infoData rounded">
		                  <option value="">상세카테고리</option>
		                  <%-- 제품명에 따른 상세카테고리를 배열로 받아와서 찍기 option value는 i로 찍기--%>
	                      <option value="1">침대</option>
	                      <option value="2">베개커버</option>
	                      <option value="3">이불</option>
	                      <option value="4">베개</option>
	                      <option value="5">침대커버</option>
	                      <option value="6">매트리스</option>
		                </select>
		                <span class="error">필수입력</span>   
		             </td>
		           </tr>
		           
		           <%-- 상품명 --%>
		           <tr>
		               <td width="25%" class="prodInputName">상품명</td>
		               <td width="75%" align="left" >
		                    <input type="text" style="width: 300px;" name="product_name" class="box infoData" />
		                  <span class="error">필수입력</span>
		              </td>
		            </tr>
		            
		            <%-- 상품이미지 --%>
		            <tr>
		               <td width="25%" class="prodInputName">상품이미지</td>
		               <td width="75%" align="left">
		                  <input type="file" name="pimage1" class="infoData" /><span class="error">필수입력</span>
		                  <input type="file" name="pimage2" class="infoData" /><span class="error">필수입력</span>
		                 </td>
		            </tr>
		            
		            
		            <%-- 성별선택 --%>
		            <tr>
		             <td width="25%" class="prodInputName" style="padding-top: 10px;">성별구분</td>
		             <td width="75%" align="left" style="padding-top: 10px;" >
		               <label for="no_gender">없음</label><input type="radio" id="no_gender" name="gender">
		               <label for="man">남</label><input type="radio" id="man" name="gender">
		               <label for="women">여</label><input type="radio" id="women" name="gender">
		             </td>
		           </tr>
		            
		            
		            
		            
		            <tr>
		               <td width="25%" class="prodInputName">상품수량</td>
		               <td width="75%" align="left">
		                  <input id="spinnerPqty" name="pqty" value="1" style="width: 30px; height: 20px;"> 개
		                  <span class="error">필수입력</span>
		               </td>
		            </tr>
		            
		            
		            
		            
		            <tr>
		               <td width="25%" class="prodInputName">가격</td>
		               <td width="75%" align="left">
		                  <input type="text" style="width: 100px;" name="saleprice" class="box infoData" /> 원
		                  <span class="error">필수입력</span>
		               </td>
		            </tr>
		            
		            <tr>
		               <td width="25%" class="prodInputName">할인율</td>
		               <td width="75%" align="left">
		                  <input type="text" style="width: 100px;" name="saleprice" class="box infoData" /> 원
		                  <span class="error">필수입력</span>
		               </td>
		            </tr>
		            
		            
		            <tr>
		               <td width="25%" class="prodInputName">상품설명</td>
		               <td width="75%" align="left">
		                  <textarea name="pcontent" rows="5" cols="60"></textarea>
		               </td>
		            </tr>
		            
		            
		            <tr>
		               <td width="25%" class="prodInputName" style="padding-bottom: 10px;">적립포인트</td>
		               <td width="75%" align="left" style="padding-bottom: 10px;">
		                  <input type="text" style="width: 100px;" name="point" class="box infoData" /> POINT
		                  <span class="error">필수입력</span>
		               </td>
		            </tr>
		            
		            <%-- === 첨부파일 타입 추가하기 --%>
		            <tr>
		                <td width="25%" class="prodInputName" style="padding-bottom: 10px;">추가이미지파일(선택)</td>
		                <td>
		                   <label for="spinnerImgQty">파일갯수 : </label>
		                <input id="spinnerImgQty" value="0" style="width: 30px; height: 20px;">
		                   <div id="divfileattach"></div>
		                    
		                   <input type="text" name="attachCount" id="attachCount" />
		                    
		                </td>
		             </tr>
		             <tr style="height: 70px;">
		               <td colspan="2" align="center" style="border-left: hidden; border-bottom: hidden; border-right: hidden;">
		                   <button type="button" class="btn btn-white border rounded" id="btnRegister">상품등록</button>
		                   &nbsp;
		                   <input type="reset" class="btn btn-white border rounded" id="btnReset" value="취소" />   
		               </td>
		            </tr>
		            
		        </tbody>
		     </table>
	     </div>
	</form>



</div>
<%-- 상품등록페이지 코드 끝 --%>




<%--footer 호출 --%>
<jsp:include page="/WEB-INF/view/footer.jsp" />