<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<div class="w3-responsive">
<table class="w3-table-all">
   <thead>
      <tr>
         <td>ID</td>
         <td>CONTACT</td>
         <td>NICKNAME</td>
         <td>ADDRESS</td>
         <td>POINT</td>
         <td>EMAIL</td>
         <td>MEMBERSHIP</td>
      </tr>
   </thead>
   <tbody>
      <c:forEach var="m" items="${ members }">
         <tr>
            <td>${ m.id }</td>
            <td>${ m.contact }</td>
            <td>${ m.nickname }</td>
            <td>${ m.address }</td>
            <td>${ m.point }</td>
            <td>${ m.email }</td>
            <td>${ m.membership }</td>
         </tr>
      </c:forEach>
   </tbody>
</table>
</div>