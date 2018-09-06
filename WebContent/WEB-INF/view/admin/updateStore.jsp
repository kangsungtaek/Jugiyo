<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<style>
.img_wrap {
   height: 200px;
   margin-top: 10px;
}

.img_wrap img {
   max-width: 100%;
   max-height: 100%;
}
</style>
</head>
<body>

   <div class="w3-container"
      style="padding-left: 100px; padding-right: 100px; width: 1000px">
      <div class="w3-row ">
         <form action="/admin/updateStore" method="post"
            enctype="multipart/form-data" id="form1">
            <input type="hidden" name="no" value="${storeVo.no }">
            <h2>가게 등록</h2>
            <p>
               ▶ <span>상표명 </span> &nbsp;| <input type="text" class="w3-input"
                  placeholder="상표명을 입력" name="name" required
                  value="${storeVo.name }" />
            </p>

            <p>
               ▶ <span>연락처 </span> &nbsp;| <input type="text" class="w3-input"
                  placeholder="연락처 입력" name="contact" required
                  value="${storeVo.contact }" />
            </p>

            <p>
               ▶ <span>업 &nbsp;&nbsp;종 </span> &nbsp;| <select name="type">
                  <c:forEach var="t" items="${ types }">
                     <c:choose>
                        <c:when test="${storeVo.type eq t.id }">
                           <option value="${ t.id }" selected="selected">${ t.name }</option>
                        </c:when>
                        <c:otherwise>
                           <option value="${ t.id }">${ t.name }</option>
                        </c:otherwise>
                     </c:choose>
                  </c:forEach>

               </select>
            </p>
            
         <div class="w3-row" style="height: 200px">
            <div class="w3-col w3-align-right" style="width: 200px">
               ▶ <span>가게 이미지 | </span>  <input class="w3-input data"
                     name="attach" type="file" id="ori" style="display: none;"
                     value="${storeVo.img }"
                     onchange="preview(this);"> <input
                     class="w3-input w3-border fake" name="gg" type="text" readOnly
                     onclick="choose(this);" value="${fileName }" />
            </div>
            
            <div class="w3-rest img_wrap" style="padding-left: 10px;">
               <img id="img" class="w3-round" src="${pageContext.request.contextPath}${storeVo.img}" />
            </div>
         </div>

            <p>
               ▶ <span>주 &nbsp;&nbsp;소 </span> &nbsp;| <input class="w3-input"
                  name="addr" id="addr" type="text" required
                  placeholder="배달받을 주소를 입력해주세요."
                  onclick="sample4_execDaumPostcode()" value="${storeVo.addr }" />
            </p>
            <div id="map" style="width: 520px; height: 300px;"></div>

            <input type="hidden" id="lat" name="xcor" value="${storeVo.xcor }" />
            <input type="hidden" id="lng" name="ycor" value="${storeVo.ycor }" />
         </form>
      </div>

      <div class="w3-center">
         <button type="submit" form="form1">수정 완료</button>
         <a href="/admin/storeList"><button type="button">뒤로가기</button></a>
      </div>

   </div>



   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb011d80a6eb4b748c64a426b88f7b1d&libraries=services"></script>



   <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new daum.maps.LatLng("${storeVo.xcor}", "${storeVo.ycor}"), // 지도의 중심좌표
         level : 3
      // 지도의 확대 레벨
      };
      //지도를 생성합니다    
      var map = new daum.maps.Map(mapContainer, mapOption);

      //마커가 표시될 위치입니다 
      var markerPosition = new daum.maps.LatLng(${storeVo.xcor},
            ${storeVo.ycor});

      //마커를 생성합니다
      var marker = new daum.maps.Marker({
         position : markerPosition
      });

      //마커가 지도 위에 표시되도록 설정합니다
      marker.setMap(map);

      //주소-좌표 변환 객체를 생성합니다
      var geocoder = new daum.maps.services.Geocoder();

      function sample4_execDaumPostcode() {
         new daum.Postcode(
               {
                  oncomplete : function(data) {
                     // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                     // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                     var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                     var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if (data.bname !== ''
                           && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if (data.buildingName !== ''
                           && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', '
                              + data.buildingName : data.buildingName);
                     }
                     // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                     }
                     // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                     if (fullRoadAddr !== '') {
                        fullRoadAddr += extraRoadAddr;
                     }

                     //var addr = data.zonecode + "/" + fullRoadAddr;
                     var addr = fullRoadAddr;
                     document.getElementById("addr").value = addr;

                     geocoder.addressSearch(addr,
                                 function(result, status) {
                                    // 정상적으로 검색이 완료됐으면 
                                    if (status === daum.maps.services.Status.OK) {
                                       var coords = new daum.maps.LatLng(
                                             result[0].y,
                                             result[0].x);

                                       // 결과값으로 받은 위치를 마커로 표시합니다
                                       var marker = new daum.maps.Marker(
                                             {
                                                map : map,
                                                position : coords
                                             });

                                       // 인포윈도우로 장소에 대한 설명을 표시합니다
                                       var infowindow = new daum.maps.InfoWindow(
                                             {
                                                content : '<div style="width:150px;text-align:center;padding:6px 0;">검색한 위치</div>'
                                             });
                                       infowindow
                                             .open(map, marker);

                                       // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                       map.setCenter(coords);
                                       
                                       console.log(coords.getLat());
                                       console.log(coords.getLng());

                                       $("#lat").val(coords.getLat());
                                       $("#lng").val(coords.getLng());
                                    }
                                 });
                  }
               }).open();
      }
      function choose(target) {
         $(target).prev().trigger("click");
      };
      function preview(target) {
         $(target).next().val(target.files[0].name);
         var reader = new FileReader();
         reader.readAsDataURL(target.files[0]);
         reader.onload = function() {
            $(target).parent().next().find("img").attr("src", this.result);
         }
      }
   </script>