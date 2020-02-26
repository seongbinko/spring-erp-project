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
<%@ include file="mysidebar.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>사원 정보 조회</h1>
		<p>사원 정보를 조회할 수 있습니다.</p>
	</div>
	
	<div class="row">
		<div class="col-sm-12 text-right">
			<form class="form-inline">				
				<div class="form-group">
					<select class="form-control" name="opt" id="search-opt">
						<option value="option" disabled selected >검색옵션</option>
						<option value="no">사원번호</option>
						<option value="name">이름</option>
						<option value="tel">연락처</option>
						<option value="departmentName">부서명</option>
						<option value="gradeName">직급</option>
					</select>
					<input type="text" class="form-control" name="keyword" id="search-keyword">
				</div>
				<button type="button" class="btn btn-primary" id="btn-search-emp">검색</button>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<table class="table" id="employee-talbe">
				<thead>
					<tr>
						<th>사원번호</th>
						<th>이름</th>
						<th>연락처</th>
						<th>부서명</th>
						<th>이메일</th>
						<th>부서위치</th>
						<th>직급</th>
						<th>입사일</th>
					</tr>
				</thead>
				<tbody id="message-search-employee">
				</tbody>
			</table>
			<button  class="btn btn-primary pull-right" id="excel-button">Excel로 받기</button>
		</div>
	</div>
	<div class="w3-center">
		<div class="w3-bar w3-border w3-round" id="pagination-box">

		 </div>
	</div>		
</div>
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog modal-lg">
  	<!-- Modal content-->
		<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal">&times;</button>
        		<h1>쪽지 보내기</h1>
      		</div>
      		<div class="row">
      			<div class="col-sm-12">                                              
		     		<form id="post-message-form" method="post" class="well">
		     			<div class="form-group">
		     				<label>받는사람</label>
		     				<input type="hidden" name="receiverNo" id="receiver-no">
		     				<input type="text" class="form-control" name=receiverName id="receiver-name">
		     			</div>
						<div class="form-group">
						  	<label>내용</label>
						  	<textarea class="form-control" rows="5" id="message-comment" name="content"></textarea>
						</div>
		     		</form>
      			</div>
      		</div>
      		
      		<div class="modal-footer">
        		<button type="button" class="btn btn-default pull-right" data-dismiss="modal">닫기</button>
        		<button type="button" class="btn btn-success pull-right" id="send-message-button">보내기</button>
      		</div>
  		</div>
	</div>
</div>
<script type="text/javascript">

	$("#excel-button").click(function(){
		var option = $("#search-opt").val();
		var keyword = $("#search-keyword").val();
		
		location.href="/hr/employees_xlsx.erp?keyword=" + keyword + "&option=" + option;
	})

	$("#btn-search-emp").click(function() {
		var option = $("#search-opt").val();
		var keyword = $("#search-keyword").val();
		var pageNo;
		
		if(option == null) {
			alert("검색옵션을 선택하세요");
			return false;
		}
		
		if(keyword == "") {
			alert("검색어를 입력하세요");
			return false;
		}
		
		if(!option || !keyword) {
			return;
		}
		
		runAjax(option, keyword, pageNo);
	});
	
	$("#search-keyword").keydown(function(event) {
		//event.preventDefault();
		
		var option = $("#search-opt").val();
		var keyword = $("#search-keyword").val();
		var pageNo;
			
		 if(event.keyCode==13) {	
			event.preventDefault();
			if(keyword == "")	{
				alert("검색어를 입력하세요")
				return false;
			}
			if(option == null) {
				alert("검색 옵션을 선택하세요")
				return false
			}
		 }	
		 runAjax(option, keyword, pageNo);
		});
	
	function runAjax(option, keyword, pageNo) {
		
		var param = {};
		if(option) {
			param.option = option;
		}
		if(keyword) {
			param.keyword = keyword;
		}
		if(pageNo) {
			param.pageNo = pageNo;
		}
		
		console.log(param)
		$.ajax({
			type:"get",
			url:"/hr/searchEmployees.erp",
			data:param,
			dataType:"json",
			success: function(result) {
				var $tbody = $("#employee-talbe tbody").empty();
			
				var pagination = result.pagination;
				
				$.each(result.employees, function(index, item) {
				
					var row = "<tr>";
					row += "<td>"+ item.no +"</td>";
					row += "<td>"+ item.name+"</td>";
					row += "<td>"+ (item.tel == null ? '-' : item.tel) +"</td>";
					row += "<td>"+ (item.departmentName == null ? '-' : item.departmentName) +"</td>";
					row += "<td>"+ (item.email == null ? '-' : item.email) +"</td>";
					row += "<td>"+ (item.departmentLocation == null ? '-' : item.departmentLocation) +"</td>";
					row += "<td>"+ (item.gradeName == null ? '-' : item.gradeName) +"</td>";
					row += "<td>"+ item.fmtDate +"</td>";
					row += "<td><button id='search-message-button-"+item.no+"' type='button' class='btn btn-info btn-xs' data-no='"+item.no+"'>"+'메세지보내기'+"</button></td>";
					row += "</tr>";
					
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
			}
			
		})
		
	};
	
	$("#message-search-employee").on('click', '[id^="search-message-button"]', function(){
		var receiverNo = $(this).data("no");
		var receiverName = $(this).parents("tr").find("td:eq(1)").text();
		
		$("#myModal #receiver-name").val(receiverName);
		$("#myModal #receiver-no").val(receiverNo);
		
		$("#myModal").modal("show");
	})  
	$("#send-message-button").click(function(){
		$("#post-message-form").attr('action', 'sendemployeemessage.erp');
		$("#post-message-form").submit();
	})
	
	// 페이지클릭시 요청
	$("#pagination-box").on('click','button', function() {
	    var data = $(this).data("page-no");
		
		var option = $("#search-opt").val();
		var keyword = $("#search-keyword").val();
		var pageNo = data;
		
		runAjax(option, keyword, pageNo);
	 })		
	
	runAjax();

</script>
</body>
</html>