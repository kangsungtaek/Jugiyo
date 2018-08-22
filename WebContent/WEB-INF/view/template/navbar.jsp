<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="w3-bar w3-black">
	<button class="w3-bar-item w3-button tablink"
		onclick="openLink(event, 'Flight');">
		<i class="fa fa-plane w3-margin-right"></i>Flight
	</button>
	<button class="w3-bar-item w3-button tablink"
		onclick="openLink(event, 'Hotel');">
		<i class="fa fa-bed w3-margin-right"></i>Hotel
	</button>
	<button class="w3-bar-item w3-button tablink"
		onclick="openLink(event, 'Car');">
		<i class="fa fa-car w3-margin-right"></i>Rental
	</button>
</div>

<script>
	// Tabs
	function openLink(evt, linkName) {
		var i, x, tablinks;
		x = document.getElementsByClassName("myLink");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < x.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" w3-red", "");
		}
		document.getElementById(linkName).style.display = "block";
		evt.currentTarget.className += " w3-red";
	}
