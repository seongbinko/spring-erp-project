<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title></title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<style type="text/css">
		td {
			text-align: center;
		}
		th {
			text-align: center;
			background-color: #f2f2f2;
		}
	</style>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<%@ include file="approvalsidebar.jsp" %>
<div class="container-fluid col-sm-9" style="margin-left:250px; padding: 50px 0px;">
	<div class="page-header">
		<h1>전체 결재 내역 조회</h1>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="pagination-box">
				<ul class="pagination pagination" id="ul-selected">				
					<li class="active"><a href="#" id="a-all">전체 내역</a></li>
					<li><a href="#" id="a-ready">대기 중</a></li>
					<li><a href="#" id="a-completed">완료</a></li>
					<li><a href="#" id="a-deny">반려</a></li>
				</ul>
			</div>
		</div>
	</div><hr/>
	<div class="row" id="div-vue">
		<div class="col-sm-12">
			<table class="table table-bordered">
				<colgroup>
					<col width="5%">
					<col width="23%">
					<col width="35%">
					<col width="9%">
					<col width="9%">
					<col width="9%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th></th>
						<th>기안일자</th>
						<th>신청 지점/매장 이름</th>
						<th>구분</th>
						<th>기안자</th>
						<th>결재자</th>
						<th>진행상태</th>
					</tr>
				</thead>
				<tbody>
					<tr v-if="approvals.length < 1">
						<td colspan="7">결재내역이 없습니다.</td>
					</tr>
					<tr v-for="(approval, index) in approvals">
						<td>{{index+1}}</td>
						<td>{{approval.fmtRequestDateWithTime}}</td>
						<td v-if="approval.storeName != null">{{approval.storeName}}</td>
						<td v-if="approval.storeName == null">{{approval.storageName}}</td>
						<td>{{approval.typeName}}</td>
						<td>{{approval.requesterName}}</td>
						<td>{{approval.responserName}}</td>
						<td>
							<a href="#" :class="getActiveClass(approval.status)" @click="showNote(index)">{{approval.status}}</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="modal fade" id="modal-note" role="dialog">
    <div class="modal-dialog modal-sm">
    	<div class="modal-content">
        	<div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal">&times;</button>
         			<h4 class="modal-title">비고</h4>
       		</div>
       		<div class="modal-body">
       			<textarea rows="5" style="width:100%" readonly>{{note | emptyNote}}</textarea>
       		</div>
        	<div class="modal-footer">
          		<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
        	</div>
      	</div>
   	</div>
</div>
<script type="text/javascript">
	var approvalApp = new Vue({
		el:"#div-vue",
		data: {
			approvals: []
		},
		filters: {
			currency: function(value) {
				if(isNaN(value)) {
					return value;
				}
				return new Number(value).toLocaleString();
			}			
		},
		methods: {
			getActiveClass: function(status) {
				if(status == '결재대기중') {
					return status = 'btn btn-warning btn-sm';
				}
				if(status == '결재완료') {
					return status = 'btn btn-success btn-sm';
				}
				if(status == '반려') {
					return status = 'btn btn-danger btn-sm';
				}	
			},
			showNote: function(index) {
				modalApp.note = approvalApp.approvals[index].note;
				$("#modal-note").modal();
				
			}
		}
	})
	// 전체 내역 받아와서 뿌리기
	function getAllApproval() {
		$.getJSON("/approvals/getAllApprovals.erp", {option:'all'}, function(result) {
			approvalApp.approvals = result;
		})
	}
	
	// 종류 필터링 li를 클릭시 해당 버튼 활성화
	$("#ul-selected li").click(function() {
		var element = this;
		$("#ul-selected li").attr("class", "");
		$(element).attr("class", "active");
	})
	
	$("#a-all").click(function() {
		getAllApproval();
	})
	
	// 결재 대기중인 리스트를 불러온다.
	$("#a-ready").click(function() {
		$.getJSON("/approvals/getAllApprovals.erp", {option:'ready'}) 
			.done(function(result) {
				approvalApp.approvals = result;
		})
	})
	// 결재 완료된 리스트를 불러온다.
	$("#a-completed").click(function() {
		$.getJSON("/approvals/getAllApprovals.erp", {option:'complete'}) 
			.done(function(result) {
				approvalApp.approvals = result;
		})
	})
	// 결재 반려된 리스트를 불러온다.
	$("#a-deny").click(function() {
		$.getJSON("/approvals/getAllApprovals.erp", {option:'deny'}) 
			.done(function(result) {
				approvalApp.approvals = result;
		})
	})
	
	var modalApp = new Vue({
		el:"#modal-note",
		data: {
			note:{}
		},
		filters: {
			emptyNote: function(value) {
				if(!value) {
					return '내용이 없습니다.';
				}
				return value;
			}
		}
	})
	
	getAllApproval();
</script>
</body>
</html>