<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
	//
%>

<jsp:include page="/WEB-INF/view/header.jsp" />

<%--직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/index.css" />

  <%-- Main시작 --%>
  <div class="Main">
    <%-- Main > 캐러셀 시작 --%>
    <div id="carousel" class="carousel slide carousel-fade" data-ride="carousel">
      <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators2" data-slide-to="0" class="active"></li> <%-- active는 맨 처음에 보여줄 타겟을 정한다.--%>
          <li data-target="#carouselExampleIndicators2" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators2" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="./images/carousel-item1.PNG" class="d-block w-100">
          <div class="carousel-caption d-none d-md-block"></div>
        </div>
        <div class="carousel-item">
            <img src="./images/carousel-item2.PNG" class="d-block w-100">
            <div class="carousel-caption d-none d-md-block"></div>            
        </div>
        <div class="carousel-item">
          <img src="./images/carousel-item3.PNG" class="d-block w-100">
          <div class="carousel-caption d-none d-md-block"></div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    <%-- Main > 캐러셀 끝 --%>
      
    
    <%-- Main > content 시작 --%>
    <div class="content mt-5">
      <div class="shortcut d-flex justify-content-between">
        <div class="shortcut_item">
          <div class="shortcut_img">
            <img src="images/carousel-item3.PNG" alt="">
          </div>
          <p class="text-center">NEW!</p>
        </div>
        <div class="shortcut_item">
          <div class="shortcut_img">
            <img src="images/추천이미지.PNG" alt="">
          </div>
          <p class="text-center">NEW!</p>
        </div>
        <div class="shortcut_item">
          <div class="shortcut_img">
            <img src="images/추천이미지.PNG" alt="">
          </div>
          <p class="text-center">NEW!</p>
        </div>
        <div class="shortcut_item">
          <div class="shortcut_img">
            <img src="images/추천이미지.PNG" alt="">
          </div>
          <p class="text-center">NEW!</p>
        </div>
        <div class="shortcut_item">
          <div class="shortcut_img">
            <img src="images/추천이미지.PNG" alt="">
          </div>
          <p class="text-center">NEW!</p>
        </div>
      </div>
      <div class="shortcut d-flex justify-content-between">
        <div class="shortcut_item mb-2">
          <div class="shortcut_img">
            <img src="./images/carousel-item3.PNG" alt="">
          </div>
          <p class="text-center">NEW!</p>
        </div>
        <div class="shortcut_item mb-2">
          <div class="shortcut_img">
            <img src="images/추천이미지.PNG" alt="">
          </div>
          <p class="text-center">NEW!</p>
        </div>
        <div class="shortcut_item mb-2">
          <div class="shortcut_img">
            <img src="images/추천이미지.PNG" alt="">
          </div>
          <p class="text-center">NEW!</p>
        </div>
        <div class="shortcut_item mb-2">
          <div class="shortcut_img">
            <img src="images/추천이미지.PNG" alt="">
          </div>
          <p class="text-center">NEW!</p>
        </div>
        <div class="shortcut_item mb-2">
          <div class="shortcut_img">
            <img src="images/추천이미지.PNG" alt="">
          </div>
          <p class="text-center">NEW!</p>
        </div>
      </div>




      <%-- 카드리스트 시작 --%>
      <div class="productList">
        <div id="card_title" class="font-weight-bold">Discount</div>
        <p id="Released_product">할인상품</p>
        <%-- 아이템박스 시작 --%>
        <div class="item_box row mt-4">

          <%-- 1 --%>
          <div class="item col-6 col-md-3 d-flex flex-column py-3">
            <a id="" class="product" href="#"><%-- id값에 제품번호 넣기!!!!*** --%>
              <div class="product">
                <div class="product_imgbox border">
                  <img src="images/안대상품더미데이터1.PNG">
                </div>
                <div id="product_simple_explain">
                  <%-- 상품 구분 넣을 곳 --%>
                  <div id="product_division">수면용품</div>
                  <%-- 상품이름 넣을 곳 --%>
                  <div id="product_name" class="my-2">쓰면 바로 개꿀잠안대</div>
                  <%-- 상품가격 넣을 곳 --%>
                  <div id="product_price" class="d-flex justify-content-between">
                    <%-- if문!!상품자체할인가격이 없다면 아래태그,상품가격 --%>
                    <span id="product_price">&#8361;5,000원</span>

                    <%-- if문!!상품자체할인가격이 있다면 아래태그,할인된가격--%>
                    <%-- <span id="product_price" style="text-decoration: line-through;">&#8361;5,000원</span> --%>
                    <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳--%>
                    <%-- <div id="discount_mark"> --%>
                      <%-- 할인율 넣을 곳 --%>
                      <%-- <span id="discount_percent">30%</span> --%>
                      <%-- <button id="discount" class="rounded"><span id="discount">discount</span></button> --%>
                    <%-- </div> --%>
                  </div>
                  <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳--%>
                  <%-- <div id="product_sale_price">&#8361;3,500<span>원</span></div> --%>
                </div>
              </div>
            </a>
          </div>



          <%-- 2 --%>
          <div class="item col-6 col-md-3 d-flex flex-column py-3">
            <a id="" class="product" href="#"><%-- id값에 제품번호 넣기!!!!*** --%>
              <div class="product">
                <div class="product_imgbox border">
                  <img src="images/안대상품더미데이터1.PNG">
                </div>
                <div id="product_simple_explain">
                  <%-- 상품 구분 넣을 곳 --%>
                  <div id="product_division">수면용품</div>
                  <%-- 상품이름 넣을 곳 --%>
                  <div id="product_name" class="my-2">쓰면 바로 개꿀잠안대</div>
                  <%-- 상품가격 넣을 곳 --%>
                  <div id="product_price" class="d-flex justify-content-between">
                    <%-- if문!!상품자체할인가격이 없다면 아래태그,상품가격 --%>
                    <span id="product_price">&#8361;5,000원</span>

                    <%-- if문!!상품자체할인가격이 있다면 아래태그,할인된가격--%>
                    <%-- <span id="product_price" style="text-decoration: line-through;">&#8361;5,000원</span> --%>
                    <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳--%>
                    <%-- <div id="discount_mark"> --%>
                      <%-- 할인율 넣을 곳 --%>
                      <%-- <span id="discount_percent">30%</span> --%>
                      <%-- <button id="discount" class="rounded"><span id="discount">discount</span></button> --%>
                    <%-- </div> --%>
                  </div>
                  <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳--%>
                  <%-- <div id="product_sale_price">&#8361;3,500<span>원</span></div> --%>
                </div>
              </div>
            </a>
          </div>


          <%-- 3 --%>
          <div class="item col-6 col-md-3 d-flex flex-column py-3">
            <a id="" class="product" href="#"><%-- id값에 제품번호 넣기!!!!*** --%>
              <div class="product">
                <div class="product_imgbox border">
                  <img src="images/안대상품더미데이터1.PNG">
                </div>
                <div id="product_simple_explain">
                  <%-- 상품 구분 넣을 곳 --%>
                  <div id="product_division">수면용품</div>
                  <%-- 상품이름 넣을 곳 --%>
                  <div id="product_name" class="my-2">쓰면 바로 개꿀잠안대</div>
                  <%-- 상품가격 넣을 곳 --%>
                  <div id="product_price" class="d-flex justify-content-between">
                    <%-- if문!!상품자체할인가격이 없다면 아래태그,상품가격 --%>
                    <span id="product_price">&#8361;5,000원</span>

                    <%-- if문!!상품자체할인가격이 있다면 아래태그,할인된가격--%>
                    <%-- <span id="product_price" style="text-decoration: line-through;">&#8361;5,000원</span> --%>
                    <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳--%>
                    <%-- <div id="discount_mark"> --%>
                      <%-- 할인율 넣을 곳 --%>
                      <%-- <span id="discount_percent">30%</span> --%>
                      <%-- <button id="discount" class="rounded"><span id="discount">discount</span></button> --%>
                    <%-- </div> --%>
                  </div>
                  <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳--%>
                  <%-- <div id="product_sale_price">&#8361;3,500<span>원</span></div> --%>
                </div>
              </div>
            </a>
          </div>


          <%-- 4 --%>
          <div class="item col-6 col-md-3 d-flex flex-column py-3">
            <a id="" class="product" href="#"><%-- id값에 제품번호 넣기!!!!*** --%>
              <div class="product">
                <div class="product_imgbox border">
                  <img src="images/안대상품더미데이터1.PNG">
                </div>
                <div id="product_simple_explain">
                  <%-- 상품 구분 넣을 곳 --%>
                  <div id="product_division">수면용품</div>
                  <%-- 상품이름 넣을 곳 --%>
                  <div id="product_name" class="my-2">쓰면 바로 개꿀잠안대</div>
                  <%-- 상품가격 넣을 곳 --%>
                  <div id="product_price" class="d-flex justify-content-between">
                    <%-- if문!!상품자체할인가격이 없다면 아래태그,상품가격 --%>
                    <%-- <span id="product_price">&#8361;5,000원</span> --%>

                    <%-- if문!!상품자체할인가격이 있다면 아래태그,할인된가격--%>
                    <span id="product_price" style="text-decoration: line-through;">&#8361;5,000원</span>
                    <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳--%>
                    <div id="discount_mark">
                      <%-- 할인율 넣을 곳 --%>
                      <span id="discount_percent">30%</span>
                      <button id="discount" class="rounded"><span id="discount">discount</span></button>
                    </div>
                  </div>
                  <%-- 상품자체할인 가격 있으면 아래 태그 넣기 태그라이브러리 들어갈 곳--%>
                  <div id="product_sale_price">&#8361;3,500<span>원</span></div>
                </div>
              </div>
            </a>
          </div>





        </div>
        <%-- item_box 끝 --%>
      </div>
      <%-- productList 끝 --%>
      <%-- 더보기버튼 시작 --%>
      <div id="more_btn">
        <button id="more_btn" type="button" class="border rounded">더보기</button>
      </div>
      <%-- 더보기버튼 끝 --%>
    </div>
    <%-- Main > content 끝 --%>
  </div>
  <%-- Main끝 --%>

  <%-- footer 호출 --%>
  <jsp:include page="/WEB-INF/view/footer.jsp" />
  