<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>매장통계 | JHTA ERP</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="/resources/css/Nwagon.css" type="text/css">
	<script src="/resources/js/Nwagon.js"></script>
	<script src="/resources/js/Nwagon_no_vml.js"></script>
	
	<style>
		*{margin:0;padding:0;}
		div{padding:0px; overflow: hidden; height: auto;}
		.hgroup{padding:20px;background-color:#e9e9e9;}
		.hgroup h1{font-family:Tahoma;}
		.hgroup p{margin:10px 0;font-size:10px}
		h2{margin:0;padding:20px;border:1px solid #000;background-color:#f9f9f9;border-width:1px 0;font-family:Tahoma;}
		
		.row .page-header {
			margin: 5px 0 5px;
		}
	</style>
	
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<%@ include file="storesidebar.jsp" %>
<div class="container-fluid col-sm-8" style="margin-left:250px; padding: 50px 0px;">
	<div class="page-header" style="margin: 30px 0px 20px;">
		<h1>통계</h1>
	</div>
		
	<div class="col-sm-12">
		<div class="row">
			<div class="col-sm-12">
		        <h4> 주간 통계내역</h4>
				<div id="chart_line">
		        
		        </div>
			</div>
			<div class="col-sm-6">
		        <h4 class="page-header">제품 통계내역 </h4>
		        <div id="Nwagon">
					
				</div>
			</div>
			<div class="col-sm-6">
		        <h4 class="page-header">일일 통계내역</h4>
				<div id="chart_d">
				</div>
			</div>
		</div>
	</div> 
	
</div>
</body>
<script type="text/javascript">
	
	var options = {
		'legend':{
			names: ['02-17', '02-18', '02-19', '02-20', '02-21', '02-22'],
			hrefs: []
		},
		'dataset':{
			title:'Playing time per day',
			values: [[61, 57, 16, 10], [76, 64, 20, 30], [20, 10, 5, 9], [43, 22, 10, 15],
					[48, 15, 14, 5], [56, 34, 20, 12], [78, 57, 23, 17]],
			colorset: ['#30a1ce','#FF8C00', '#339933', '#DC143C'],
			fields:['발주량', '판매량', '교환량', '폐기량']
		},
		'chartDiv' : 'chart_line',
		'chartType' : 'line',
		'chartSize' : {width:1250, height:250},
		'minValue' : 00,
		'maxValue' : 100,
		'increment' : 10,
		'isGuideLineNeeded' : true  //default set to false
	};
	Nwagon.chart(options);
	
	
	
	var options = {
		'legend': {
			names: ['스마트폰','모바일 악세서리','TV','냉장고','에어컨','세탁기','청소기','노트북','컴퓨터'],
			hrefs: [
				'http://nuli.navercorp.com/sharing/blog/post/1132444',
				'http://nuli.navercorp.com/sharing/blog/post/1132442',
				'http://nuli.navercorp.com/sharing/blog/post/1132439',
				'http://nuli.navercorp.com/sharing/blog/post/1132426',
				'http://nuli.navercorp.com/sharing/blog/post/1115205',
				'http://nuli.navercorp.com/sharing/blog/post/1111811',
				'http://nuli.navercorp.com/sharing/blog/post/1111181',
				'http://nuli.navercorp.com/sharing/blog/post/1096163',
				'http://nuli.navercorp.com/sharing/blog/post/1079940'
			]
		}, 
		'dataset': {
			title: 'Playing time per day',
			values: [
				[5,7,2,1], [2,5,3,2], [7,5,3,2], [6,1,5,1], [5,3,3,4], [8,3,1,2], [6,3,5], [6,2,6,1], [8,2,4,1]
			],
			colorset: ['#30a1ce','#FF8C00', '#339933', '#DC143C'],
			fields: ['발주량', '판매량', '교환량', '폐기량']
		},
		'chartDiv': 'Nwagon',
		'chartType': 'stacked_column',
		'chartSize': { width: 600, height: 352},
		'maxValue': 20,
		'increment': 1
	};
	Nwagon.chart(options);
	
	var options = {
		'dataset': {
			title: 'Web accessibility status',
			values:[78, 57, 23, 17],
			colorset: ['#2BC8C9', '#FF8C00', '#2EB400','#DC143C'],
			fields: ['발주량', '판매량',  '교환량', '폐기량'] 
		},
		'donut_width' : 40, 
		'core_circle_radius':60,
		'chartDiv': 'chart_d',
		'chartType': 'donut',
		'chartSize': {width:800, height: 352}
	};
	Nwagon.chart(options); 
	
	
	
</script>
</html>