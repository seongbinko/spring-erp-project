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
<c:if test="${param.result eq 'deletemessage' }">
	<div class="row">
		<div class="col-sm-12">
			<div class="alert alert-danger">
				<h4>메세지를  삭제하였습니다.</h4>
			</div>
		</div>
	</div>
</c:if>
	<div class="row">
		<div class="col-sm-12">
			<h1>보낸 메세지함</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<form id="delete-form">
				<table class="table">
					<colgroup>
								<col width="5%">
								<col width="10%">
								<col width="60%">
								<col width="25%">
					</colgroup>
					<thead>
						<tr>
							<th></th>
							<th>받는 사람</th>
							<th>내용</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody id="message-list-table">
						<c:forEach var="message" items="${getMessages }">
							<tr>
								<td><input type="checkbox" name="messageno" value="${message.no }"></td>
								<td>${message.receiverName }</td>
								<td><a href="send_detailmessage.erp?messageno=${message.no }">${message.content }</a></td>
								<td><fmt:formatDate value="${message.messageDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div>
				<button type="button" class="btn btn-danger pull-right" id="btn-selected-del">삭제</button>
			</div>
		</div>
	</div>
</div>
<div id="mymodal" class="modal fade" role="dialog">
	<div class="modal-dialog modal-lg">
  	<!-- Modal content-->
		<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal">&times;</button>
        		<h4>삭제 확인</h4>
      		</div>
      		<div class="modal-body">
	          		<p>메세지를 삭제하시겠습까?</p>  	
        	</div>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-default pull-right" data-dismiss="modal">취소</button>
        		<button type="button" class="btn btn-danger pull-right" id="delete-message">삭제</button>
      		</div>
  		</div>
	</div>
</div>
<script type="text/javascript">
	$("#btn-selected-del").click(function() {
		var checkbox = $("input[type=checkbox]:checked");
		if(checkbox.length == 0 ) {
			alert("삭제할 메세지가 없습니다.")
			return false;
		}
	/* 	var checkedMessages = [];
		$("#message-list-table [name=messageno]:checked").each(function(index, checkbox) {
			checkedMessages.push($(checkbox).val());
		}) */
		
		$("#mymodal").modal("show");
		
	});
	$("#delete-message").click(function() {
		$("#delete-form").attr("action", "deleteSelectedSendMessages.erp");
		$("#delete-form").submit();
	});
</script>
</body>
</html>