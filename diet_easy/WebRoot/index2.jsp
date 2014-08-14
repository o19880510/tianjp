<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/views/common/common_tags.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>展示界面测试</title>
<link rel="stylesheet" type="text/css"
	href="<w:path/>resources/css/bootstrap.min.css">
<style type="text/css">
body {
	padding-top: 80px;
}
</style>
	<link rel="stylesheet" type="text/css" href="<w:path/>resources/css/bootstrap-responsive.min.css">
	<link id="skinUri" rel="stylesheet" type="text/css" href="<w:path/>resources/css/main.css">
	<script type="text/javascript" src="<w:path/>resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="<w:path/>resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<w:path/>resources/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="<w:path/>resources/js/pagination.js"></script>
	<script type="text/javascript" src="<w:path/>resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="<w:path/>resources/js/jquery.cookie.js"></script>
	<!--[if lt IE 9]>
    	<script type="text/javascript" src="<w:path/>resources/js/html5shiv.js"></script>
    <![endif]-->
</head>

<body>
	<div id="accordion" class="accordion">
		<div class="accordion-group">
			<div class="accordion-heading">
				<a href="#addAccordion" class="accordion-toggle"
					data-toggle="collapse" data-parent="#accordion"> <i
					class="icon-th-large icon-white"></i> <span>展示界面测试</span> <i
					class="icon-chevron-down icon-white pull-right"></i>
				</a>
			</div>
			
			<div id="addAccordion" class="accordion-body in">
				<div class="accordion-inner">
					<form class="form-inline"></form>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>日期</th>
								<th>天气</th>
								<th>详情</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>2014-8-13</td>
								<td>有雨<br>27-30℃</td>
								<td>
								<div style="float: left; margin: 0px 30px 0px 0px;">
										饮食+
										<table>
											<tr>
												<td>09:00</td>
												<td>早餐</td>
												<td>胡萝卜,胡萝卜,胡萝卜,胡萝卜,胡萝卜</td>
											</tr>
											<tr>
												<td>12:10</td>
												<td>中餐</td>
												<td>胡萝卜</td>
											</tr>
											<tr>
												<td>18:40</td>
												<td>晚餐</td>
												<td>炒面</td>
											</tr>
										</table>
									</div>
									<div style="float: left;">
										身体
										<table>
											<tr>
												<td>15:00</td>
												<td>发热</td>
												<td>37.6℃</td>
											</tr>
										</table>
									</div>
									<div style="float: left;">
										身体
										<table>
											<tr>
												<td>15:00</td>
												<td>发热</td>
												<td>37.6℃</td>
											</tr>
										</table>
									</div>

									<div
										style="float: left; width: 90px; height: 150px; border-style: dashed; text-align: center;vertical-align:inherit; font-size: large;">
										&#43;
									</div>
								</td>
							</tr>
							</tbody>
							<thead>
							<tr>
								<td colspan="3">
									
								</td>
							</tr>
							</thead>
						
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
