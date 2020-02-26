<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<%@ include file="../my/mysidebar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="text-center" style="margin-top: 100px;">	
				<h1>공지사항  </h1> 
				<hr>
				<div class="btn-group" role="group" id="search-notice">
	  				<a href="" class="btn  ${empty param.deptno  || param.deptno eq 0 ? 'btn-primary' : 'btn-default' }" data-value="0"  id="all-notice">전체보기</a>
	  				<c:forEach var="dept" items="${departments }">
	  					<a href="" class="btn ${param.deptno eq dept.no ? 'btn-primary' : 'btn-default' }" data-value="${dept.no }" >${dept.name }</a>	  				
	  				</c:forEach> 
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12" >
		<div id="notice-size">
			
		</div>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody id="notice-list-table">
				</tbody>
			</table>
		</div>
	</div>
	<div class="w3-center">
		<div class="w3-bar w3-border w3-round" id="pagination-box">

		 </div>
	</div>		
</div>
<script type="text/javascript">
	var clickedDeptNo = 0;

	$("#search-notice a").on('click', function(event) {
		event.preventDefault();
		
		$("#search-notice a").removeClass("btn-primary").addClass("btn-default");
		$(this).addClass('btn-primary');
		
		getNotices();
		
	})
	
	$("#pagination-box").on('click', 'button', function() {
		var page = $(this).data("page-no");
		getNotices(page);
	})
	
	
	
	function getNotices(page) {
		var clickedDeptNo = $("#search-notice a.btn-primary").data('value');
		var $tbody = $("#notice-list-table").empty();
		
		$.getJSON("/notice/search.erp", {deptno:clickedDeptNo, pageno:page }, function(result) {
			
			
			var pagination = result.pagination;
			var notices = result.notices;
			
			$("#notice-size").empty();
			var size = result.notices.length;
			var sizeContent = "<p>" + size + " 개의 공지사항이 있습니다.</p>";
			$("#notice-size").prepend(sizeContent);
			
			
			$.each(notices, function(index, item) {
				console.log(item);
				var row = "<tr>";
				row += "<td>" + (index + 1) + "</td>";
				row += "<td>" + item.departmentName + "</td>";
				row += "<td><a href='detail.erp?deptno="+clickedDeptNo+"&noticeno="+item.no+"&pageno="+pagination.pageNo+"'>" + item.title + "</a></td>";
				row += "<td>" + item.fmtDate + "</td>";
				row += "<td>" + item.viewCount + "</td>";
				row += "</tr>"
				
				$tbody.append(row);
			})
			
			var buttons = "";
			if (!pagination.first) {
				buttons += ' <button class="w3-button w3-hover-blue" data-page-no="'+(pagination.pageNo -1)+'">&laquo;</button>';					
			}
			for (var i=pagination.beginPage; i<=pagination.endPage; i++) {
				if (pagination.pageNo == i) {
					buttons += '<button class="w3-button w3-blue" data-page-no="'+i+'">'+i+'</button>';						
				} else {
					buttons += '<button class="w3-button" data-page-no="'+i+'">'+i+'</button>';						
				}
			}
			if (!pagination.last) {
				buttons += ' <button class="w3-button w3-hover-blue" data-page-no="'+(pagination.pageNo +1)+'">&raquo;</button>';					
			}			

			$("#pagination-box").empty().html(buttons);
		})
	}
	
	//$("#search-notice a.btn-primary").trigger('click');
	getNotices(${param.pageno});
	
	
	
</script>
</body>
</html>