<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common_tags.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>饮食管理</title>
</head>
<body>
<div id="accordion" class="accordion">
	<div class="accordion-group">
		<div class="accordion-heading">
			<a href="#addAccordion" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion">
				<i class="icon-th-large icon-white"></i>
				<span>饮食记录增加</span>
				<i class="icon-chevron-down icon-white pull-right"></i>
			</a>
		</div>
		<div id="addAccordion" class="accordion-body in">
			<div class="accordion-inner">
				<form:form id="diet" action="add.do" method="post" cssClass="form-horizontal">
					
					<div class="control-group">
						<label class="control-label">时间</label>
						<div class="controls">
							<input name="startDate" class="input-middle Wdate" onclick="WdatePicker()"/>
						</div>
					</div>
					
					
					<div class="control-group">
						<label class="control-label">天气</label>
						<div class="controls">
							<input name="weather" class="input-small"/>&nbsp;&nbsp;&nbsp;
							<input name="temperature" class="input-small"/>&nbsp;&nbsp;&nbsp;
							<a href="add.do" class="btn">获取</a>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">类型</label>
						<div class="controls">
							<select class="" style="width: 7%">
								<codetable:option table="<%=ParamConstants.BEHAVIOR_TYPE %>"/>
							</select>
							<a href="add.do" class="btn">新增</a>
						</div>
					</div>
					
					<div class="control-group">
						<div class="controls">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>类型</th>
										<th>子类型</th>
										<th>时间开始</th>
										<th>时间结束</th>
										<th>详情</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<select style="width: 80px;">
												<codetable:option table="<%=ParamConstants.BEHAVIOR_TYPE %>"/>
											</select>
										</td>
										<td>
											<select style="width: 130px;">
												<option>---Empty---</option>
											</select>
										</td>
										<td>
											<input name="timeStart" maxlength="2" style="width: 23px;" />：
											<input name="timeStart" maxlength="2" style="width: 23px;" />
										</td>
										<td>
											<input name="timeStart" maxlength="2" style="width: 23px;" />：
											<input name="timeStart" maxlength="2" style="width: 23px;" />
										</td>
										<td>
										</td>
										<td>
											<a href="#" class="add btn">添加</a>
											<a href="#" class="remove btn">删除</a>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">提交</button>
						<button type="reset" class="btn">重置</button>
						<a href="${returnURI}" class="btn">返回</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>

<codetable:json table="421" type='Object' none="null2"/>

<c:forEach items="${mdata:get('PARAMETER_MAP')['BEHAVIOR_TYPE'] }" var="behaviorType">
	${behaviorType.key }
</c:forEach>
<script type="text/javascript">
	
 var BEHAVIOR_TYPE = <codetable:json table="<%=ParamConstants.BEHAVIOR_TYPE %>" type='Object'/> ;

 var SUB_TYPE = [];
 <c:forEach items="${mdata:get('PARAMETER_MAP')['BEHAVIOR_TYPE'] }" var="behaviorType">
 	
	var ${behaviorType.key } = <codetable:json table="${behaviorType.key }" type='Object' none="null"/> ;
	
	var subTypeKey = '${behaviorType.key }' ;
	if(subTypeKey !== null && subTypeKey !== '' && subTypeKey !== undefined && subTypeKey !== "undefined"){
		SUB_TYPE.push(${behaviorType.key });
	}
	
</c:forEach>

console.log(SUB_TYPE);
</script>
</body>
</html>