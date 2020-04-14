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
	<style type="text/css">
		.bold {
			font-weight: bolder; color:blue;
		}
	</style>
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
			<h1>받은 메세지함 (안읽은 메세지: ${isReadCount }개)</h1>
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
							<th>보낸사람</th>
							<th>내용</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody id="message-list-table">
						<c:forEach var="message" items="${getMessages }">
							<c:choose>		
								<c:when test="${message.isRead eq 'N'}">
									<tr>
										<td><input type="checkbox" name="messageno" value="${message.no }"></td>
										<td><p class="bold">${message.senderName }</p></td>
										<td><p class="bold"><a href="detailmessage.erp?messageno=${message.no }">${message.content }</a></p></td>
										<td><p class="bold"><fmt:formatDate value="${message.messageDate }" pattern="yyyy-MM-dd HH:mm:ss"/></p></td>
									</tr>	
								</c:when>
								<c:otherwise>
									<tr>
										<td><input type="checkbox" name="messageno" value="${message.no }"></td>
										<td>${message.senderName }</td>
										<td><a href="detailmessage.erp?messageno=${message.no }">${message.content }</a></td>
										<td><fmt:formatDate value="${message.messageDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									</tr>		
								</c:otherwise>	
							</c:choose>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div>
				<button type="button" class="btn btn-info pull-right" id="send-message">메세지 보내기</button>
				<button type="button" class="btn btn-danger pull-right" id="btn-selected-del">삭제</button>
			</div>
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
      			<div class="col-sm-6 " style="width:434px; height:292px; overflow-y: scroll;">
      				<table class="table">
      					<thead>
      						<tr>
      							<th>이름</th>
      						</tr>
      					</thead>
      					<tbody id="tbody-employees">
							<c:forEach var="allEmployee" items="${allEmployees }" >
      							<tr>
   									<td><a href="#" data-value="${allEmployee.name }" data-no="${allEmployee.no }">${allEmployee.name }</a></td>
      							</tr>
							</c:forEach>		
      					</tbody>
      				</table>
      			</div>
      			<div class="col-sm-6">                                              
		     		<form id="post-message-form" method="post" class="well">
		     			<div class="form-group">
		     				<label>받는사람</label>
		     				<input type="hidden"  name="receiverNo" id="receiver-no">
		     				<input value ="" type="text" class="form-control" name=receiverName id="receiver-name">
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
	$("#send-message").click(function() {
		$("#myModal").modal("show");
		
	})
	
	
	
	
	$("#send-message-button").click(function() {
			$("#post-message-form").attr('action', 'sendmessage.erp');
			$("#post-message-form").submit();
	})

	$("#post-message-form").submit(function() {
		var content = $("#message-comment").val();
		if(content == "") {
			alert("내용을 입력하세요")
			return false;
		}
		return true;
	})
	
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
		$("#delete-form").attr("action", "deleteSelectedMessages.erp");
		$("#delete-form").submit();
	});
	
	$("#tbody-employees a").click(function(event) {
		event.preventDefault();
		var employeeName = $(this).data("value");
		var employeeNo = $(this).data("no");
		$("#receiver-name").val(employeeName);
		$("#receiver-no").val(employeeNo);
	}) 
	
</script>
</body>
</html>