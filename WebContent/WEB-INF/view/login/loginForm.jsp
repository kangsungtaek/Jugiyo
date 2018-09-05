<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
   .form_input {text-align:center; width:100%; height:38px; position:relative; bottom:10px;}
   .input_txtBox {width:300px; height:auto; margin:0 0 20px 0;}
   .tab_width {text-align:center;}
   .w3-row {margin:0 auto;}
   /*-- top.jsp--*/
   .w3-orange {width:100%; height:400px; margin-top: 20px; position:absolute; top:0px; border:1px solid #ccc;}
   /*   .hide {display:none;}   */
</style>
<div id="wrap" class="w3-panel w3-padding-64 w3-orange w3-container">   
   <div class="w3-row" style="width:169px;">
       <h2 class="hide" style="text-align: center;"> 로그인</h2>
       <div class="w3-bar w3-black" style="text-align: center;">
          <button type="button" class="w3-bar-item w3-button tablink w3-red mode " value="member">개인회원</button>
          <button type="button" class="w3-button w3-button mode" value="owner">사업자</button>
        </div>
    </div>
    <form action="/login/loginForm" method="post" class="form_input" id="loginForm" >
         <input type="hidden" name="section" id="hs" value="member"/>
         <input name="id" type="text" id="id" class="input_txtBox" width="300px;" placeholder=" 아이디" ><br/>
         <input name="password" type="password" class="input_txtBox" id="password" width="300px;" placeholder=" 비밀번호" ><br/>
         <button type="submit" class="w3-button w3-black input_txtBox">로그인</button>    
   </form>
</div>
<script src="../../../js/w3-mode.js"></script>