<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script>
	$(document).ready(function() {
		$('#viewType').change(function() {
			$.ajax({
				url : '../control/viewTypeCon.jsp',
				data : {
					viewType : $(this).val()
				},
				success : function(data) {
					$('.memList').empty();
					$('.memList').append($.trim(data));
				}
			});
		});
	});

	function deleteM(key) {
		location.href = "../control/btnAction.jsp?dkey=" + key;
	}
</script>

<div class="memHeader">
	<select name="viewType" id="viewType">
		<option value="" selected disabled hidden>viewType</option>
		<option value="HTML">HTML</option>
		<option value="JSON">JSON</option>
		<option value="XML">XML</option>
	</select>
</div>
<hr>

<div class="memList"></div>