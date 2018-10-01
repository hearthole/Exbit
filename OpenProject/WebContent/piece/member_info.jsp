<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script>


	$(document).ready(function() {
		$('.memList').load('../control/viewTypeHTML.jsp');
		$('#viewType').change(function() {
			if ($(this).val() == 'HTML') {
				$.ajax({
					url : '../control/viewTypeHTML.jsp',
					data : {
						viewType : $(this).val()
					},
					error : function(error) {
				        alert("Error!");
				    },
					success : function(data) {
						$('.memList').empty();
						$('.memList').append($.trim(data));
					}
				});
			}
			if ($(this).val() == 'JSON') {
				$.getJSON('../control/viewTypeJSON.jsp', function(data) {
					success : $.each(data, function(key, value) {
						$('.memList').empty();
					});

				});
			}
			if ($(this).val() == 'XML') {
				$.ajax({
					url : '../control/viewTypeXML.jsp',
					error : function(error) {
				        alert('error');
				    },
					success : function(data) {
						$('.memList').empty();
						$('.memList').append($('data'));
						$(data).find('members').each(function(){
							var member = $(this).find('member').text();
							var htmlstr = '<h1>'+ member +'</h1>'
							$('.memList').append(htmlstr);
							
						});	
					}
				});
			}
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