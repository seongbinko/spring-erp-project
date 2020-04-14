<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
    	.navbar { background-color: #607d8b; color: white !important;}
    	.container {padding: 50px 0px;}
    </style>
<nav class="navbar navbar-fixed-top" style="margin-bottom:100px; ">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/main.erp">
				<img alt="로고" src="/resources/images/logo/logo-white.png" style="margin-left: 30px;">
			</a>
    	</div>
    	
    	<ul class="nav navbar-nav" style="margin-left: 60px;">
			<li class="active"><a href="/main.erp">메인</a></li>
    	</ul>
    	<%-- <c:if test=""> --%>
		    <ul class="nav navbar-nav" id="emp">
				<li><a href="/hr/hrm.erp">인사</a></li>
				<li><a href="">관리</a></li>
				<li><a href="">부서</a></li>
				<li><a href="">직원</a></li>
		    </ul>
    	<%-- </c:if> --%>
	    
	    <%-- <c:if test=""> --%>
		    <ul class="nav navbar-nav" id="store">
				<li><a href="/store/main.erp">매장</a></li>
				<li><a href="/stock/main.erp">매장재고</a></li>
		    </ul>
	    <%-- </c:if> --%>
	    
	    <%-- <c:if test=""> --%>
		    <ul class="nav navbar-nav" id="products">
				<li><a href="/products/main.erp">제품관리</a></li>
				<li><a href="/storemanagement/main.erp">지점 관리</a></li>
		    </ul>
	    <%-- </c:if> --%>
	    
	    <%-- <c:if test=""> --%>
		    <ul class="nav navbar-nav" id="approvals">
				<li><a href="/approvals/main.erp">전자 결재</a></li>
		    </ul>
	    <%-- </c:if> --%>
	    
	    <c:if test="${not empty LE }">
	    	<script type="text/javascript">
	    		var ws = new WebSocket("ws://www.erp.com/alarm.erp");
	    		ws.onmessage = function(event) {
	    			var message = event.data;
	    			alert(message);
	    		}
	    	</script>
	    </c:if>
	    
	    <ul class="nav navbar-nav navbar-right">
	      <li><a href="/my/my.erp">내 정보</a></li>
	      <li><a href="/logout.erp">로그아웃</a></li>
	    </ul>
	    
  	</div>
</nav>