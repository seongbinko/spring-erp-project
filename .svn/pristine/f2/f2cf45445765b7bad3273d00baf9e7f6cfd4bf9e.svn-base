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
	<c:if test="${param.result eq 'sendmessagesuccess' }">
			<div class="row">
				<div class="col-sm-12">
					<div class="alert alert-success">
						<h4>메세지를 성공적으로 보냈습니다.</h4>
					</div>
				</div>
			</div>
	</c:if>
	<div class="row">
		<div class="col-sm-12">
			<h1>받은 메세지</h1>
			<table class="table table-bordered">
				<tr>
					<th>받는사람</th>
					<td>${detailMessage.receiverName }</td>
					<th>보낸날짜</th>
					<td><fmt:formatDate value="${detailMessage.messageDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
				<tr>
					<th class="active">내용</th>
					<td colspan="10"><textarea rows="6" class="form-control" readonly="readonly">${detailMessage.content }</textarea> </td>
				</tr>
			</table>
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
        		<a href="deletesendmessage.erp?messageno=${detailMessage.no }"><button type="button" class="btn btn-danger pull-right" id="delete-message">삭제</button></a>
      		</div>
  		</div>
	</div>
</div>

<script type="text/javascript">
	$("#btn-selected-del").click(function() {
		$("#mymodal").modal("show");
	})
	
	
	$("#send-message-button").click(function() {
		$("#post-message-form").attr('action', 'sendmessage.erp');
		$("#post-message-form").submit();
	})
	
	$("#delete-message").click(function() {
		
	})
</script>
</body>
</html>