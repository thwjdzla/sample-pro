<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../include/nav.jsp" %>
<div class="container">
	<h1>
		도서검색
		<button class="btn btn-default pull-right" id="advanced-search-btn">확장검색</button>
	</h1>
	<form class="well" id="search-form" method="post" action="search.do">
		<div class="radio advanced">
			<label class="radio-inline">
				<input type="radio" name="status" value="Y"> 판매중
			</label>
			<label class="radio-inline">
				<input type="radio" name="status" value="N"> 절판
			</label>
		</div>
		<div class="checkbox advanced">
			<label class="checkbox-inline">
				<input type="checkbox" name="categories" value="소설"> 소설
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" name="categories" value="인문"> 인문 
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" name="categories" value="외국어"> 외국어 
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" name="categories" value="자기계발"> 자기계발 
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" name="categories" value="시/에세이"> 시/에세이 
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" name="categories" value="경영/경제"> 경영/경제 
			</label>
		</div>
		<div class="form-group">
			<label>제목</label>
			<input type="text" class="form-control" name="title" />
		</div>
		<div class="form-group advanced">
			<label>저자</label>
			<input type="text" class="form-control" name="author" />
		</div>
		<div class="form-group advanced">
			<label>출판사</label>
			<input type="text" class="form-control" name="publisher" />
		</div>
		<div class="form-group advanced">
			<label>최저가격</label>
			<input type="number" class="form-control" name="minPrice" />
		</div>
		<div class="form-group advanced">
			<label>최고가격</label>
			<input type="number" class="form-control" name="maxPrice" />
		</div>
		<div class="text-right">
			<button class="btn btn-primary">검색</button>
		</div>
	</form>
	
	<h3>조회 결과</h3>
	<table class="table" id="book-table">
		<colgroup>
			<col width="5%" />
			<col width="5%" />
			<col width="10%" />
			<col width="*" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
			<col width="7%" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>절판여부</th>
				<th>종류</th>
				<th>제목</th>
				<th>저자</th>
				<th>출판사</th>
				<th>가격</th>
				<th>할인율</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
</div>
</body>
<script type="text/javascript">
$(function() {
	$(".advanced").hide();

	$("#advanced-search-btn").click(function() {
		var text = $(this).text();
		if(text === '확장검색') {
			$(".advanced").show();
			$(this).text('간단검색');	
		} else {
			$(".advanced").hide();
			$(this).text('확장검색');	
		}
	});
	
	$("#search-form").submit(function() {
		
		var $tbody = $("#book-table tbody").empty();
		
		$.ajax({
			type: "POST",
			url: "/ajax/search.do",
			dataType: "json",
			data: $("#search-form").serialize(),
			success: function(result) {
				var isSuccess = result.success;
				if (isSuccess) {
					var books = result.items;
					$.each(books, function(index, book) {
						var row = "<tr>";
						row += "<td>"+book.no+"</td>";
						row += "<td>"+book.status+"</td>";
						row += "<td>"+book.mainCategory+"</td>";
						row += "<td>"+book.title+"</td>";
						row += "<td>"+book.author+"</td>";
						row += "<td>"+book.publisher+"</td>";
						row += "<td>"+book.fixedPrice+"</td>";
						row += "<td>"+book.discountRate+"</td>";
						row += "</tr>;"
						
						$tbody.append(row);
					});
					
				} else {
					$tbody.append("<tr><td colspan='8' class='text-center'>조회 결과 없음</td></tr>");
				}
			},
			error: function() {
				
			}
		});
		
		return false;
	});
	
	
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "search.do");
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var text = xhr.responseText;
			console.log("응답데이터", text);
			var obj = JSON.parse(text);
			
			console.log(obj.name)			// 트와이스
			console.log(obj.members[0])		// 쯔위
			console.log(obj.company.name)	// JYP
		}
	}
	xhr.send();
	
	$.ajax({	// ajax란 이름의 함수를 실행
		type: "GET",
		url: "search.do",
		success:function(result) {
			console.log(obj.name)			// 트와이스
			console.log(obj.members[0])		// 쯔위
			console.log(obj.company.name)	// JYP
		}
	})
	
	function ajax(obj) {
		var xhr = new XMLHttpRequest();
		xhr.open(obj.type, obj.url);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var text = xhr.responseText;
				console.log("응답데이터", text);
				var result = JSON.parse(text);
				
				obj.success(result);
			}
		}
		xhr.send();
	}
	
	
	public class User {
		private String name;
		private String id;
		private int age;
	}
	User user = new User("홍길동", "hong", 25);
	----> '{"name":"홍길동", "id":"hong", "age":25}'
	
	
});
</script>
</html>



















