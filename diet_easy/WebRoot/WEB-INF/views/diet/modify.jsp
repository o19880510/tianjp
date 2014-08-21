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
				<span>饮食记录修改</span>
				<i class="icon-chevron-down icon-white pull-right"></i>
			</a>
		</div>
		<div id="addAccordion" class="accordion-body in">
			<div class="accordion-inner">
				<form:form id="diet" action="modify.do" method="post" modelAttribute="newDietReq" cssClass="form-horizontal">
					
					<input type="hidden" name="id" value="${dietMaster.id }"/>
					
					<div class="control-group">
						<label class="control-label">时间</label>
						<div class="controls">
							<input name="day" class="input-middle Wdate" onclick="WdatePicker()" value="${dietMaster.day }"/>
						</div>
					</div>
					
					
					<div class="control-group">
						<label class="control-label">天气</label>
						<div class="controls">
							<select id="city" name="city" style="width: 80px;">
								<codetable:option table="<%=ParamConstants.CITY %>" selectValue="${dietMaster.city }"/>
							</select>&nbsp;&nbsp;&nbsp;
							天气<input name="weather" class="input-small" value="${dietMaster.weather }"/>&nbsp;&nbsp;&nbsp;
							温度<input name="temperature" class="input-small" value="${dietMaster.temperature }"/>&nbsp;&nbsp;&nbsp;
							<iframe></iframe>
						</div >
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
									
									<tr style="display:none;">
										<td>
											<select style="width: 80px;" class="main">
												<codetable:option table="<%=ParamConstants.BEHAVIOR_TYPE %>"/>
											</select>
										</td>
										<td>
											<select style="width: 130px;">
												<c:forEach end="0" var="type" items="${mdata:get('PARAMETER_MAP')['BEHAVIOR_TYPE'] }">
													<codetable:option table="${type.key }"/>
												</c:forEach>
											</select>
										</td>
										<td>
											<input type="hidden"/>
											<input maxlength="2" style="width: 23px;" />：
											<input maxlength="2" style="width: 23px;" />
										</td>
										<td>
											<input type="hidden"/>
											<input maxlength="2" style="width: 23px;" />：
											<input maxlength="2" style="width: 23px;" />
										</td>
										<td>
											<textarea rows="4" cols="30" maxlength="300"></textarea>
										</td>
										<td>
											<a href="#" class="add btn">添加</a>
											<a href="#" class="remove btn">删除</a>
										</td>
										</tr>
										
									<c:forEach items="${dietRecordList }" var="dietRecord">
										
										<tr>
											<td>
												<select style="width: 80px;" class="main">
													<codetable:option table="<%=ParamConstants.BEHAVIOR_TYPE %>" selectValue="${dietRecord.type }"/>
												</select>
											</td>
											<td>
												<select style="width: 130px;">
													<codetable:option table="${dietRecord.type }" selectValue="${dietRecord.subType }"/>
												</select>
											</td>
											<td>
												<input type="hidden" name="timeStart" value="${dietRecord.timeStart }"/>
												<input maxlength="2" style="width: 23px;" value='${fn:split(dietRecord.timeStart, ":")[0] }'/>：
												<input maxlength="2" style="width: 23px;" value='${fn:split(dietRecord.timeStart, ":")[1] }'/>
											</td>
											<td>
												<input type="hidden" name="timeEnd" value="${dietRecord.timeEnd }"/>
												<input maxlength="2" style="width: 23px;" value='${fn:split(dietRecord.timeEnd, ":")[0] }'/>：
												<input maxlength="2" style="width: 23px;" value='${fn:split(dietRecord.timeEnd, ":")[1] }'/>
											</td>
											<td>
												<textarea rows="4" cols="30" maxlength="300">${dietRecord.desc }</textarea>
											</td>
											<td>
												<input type="hidden" name="id" value="${dietRecord.id }"/>
												<a href="#" class="add btn">添加</a>
												<a href="#" class="remove btn">删除</a>
											</td>
										</tr>
									
									</c:forEach>
									
									
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="form-actions">
						<button type="submit" onclick="Controller.formSubmit()" class="btn btn-primary">提交</button>
						<button type="reset" class="btn">重置</button>
						<a href="javascript:history.go(-1);" class="btn">返回</a>
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
	var Model = {
			Types:{
				BEHAVIOR_TYPE:<codetable:json table="<%=ParamConstants.BEHAVIOR_TYPE %>" type='Object'/>
			},
			options: function(type){
				var subType = this.Types[type];
				if(!subType){
					return "";
				}
				
				var options = "";
				for(var i =0 ; i < subType.length; i++){
					options += "<option value='"+subType[i].key+"'>"+subType[i].value+"</option>"
				}
				
				return options;
			}
	};
	
	(function ModelTypeInit(){
		 <c:forEach items="${mdata:get('PARAMETER_MAP')['BEHAVIOR_TYPE'] }" var="behaviorType">
			var ${behaviorType.key } = <codetable:json table="${behaviorType.key }" type='Object' none="null"/> ;
			var subTypeKey = ${behaviorType.key } ;
			if(subTypeKey !== null && subTypeKey !== '' && subTypeKey !== undefined && subTypeKey !== "undefined"){
				Model.Types['${behaviorType.key }'] = ${behaviorType.key };
			}
		</c:forEach>
		
		console.log("TYPES:" + JSON.stringify(Model.Types));
	})();
	
	
	var Controller = {
			addEventListenerForTable: function(){
				$('table').on("click", function(event){
					var target = event.target;
					var parent = $(target).parents("tr:eq(0)");
					
					if(target.className.indexOf("add") != -1){
						Controller.eventHander.add(event, target, parent );
					} else if(target.className.indexOf("remove") != -1){
						Controller.eventHander.remove(event, target, parent);
					}
				})
				.on("change", function(event){
					var target = event.target;
					var parent = $(target).parents("tr:eq(0)");
					
					if(target.tagName === "SELECT" && target.className.indexOf("main") != -1){
						Controller.eventHander.mainSelect(event, target, parent);
					}
				})
				.on("keyup", function(event){
					var target = event.target;
					var valueLength = target.value.length;
					var maxLength = target.getAttribute("maxlength");
					
					if(valueLength == maxLength){
						var tr = $(target).parents("tr:eq(0)");
						var inputs = tr.find("input:not(:hidden)");
						console.log(inputs.length)
						for(var i = 0; i < inputs.length;i++){
							if(inputs[i] == target ){
								if(inputs[i+1]){
									inputs[i+1].focus();
								}else{
									tr.find("textarea").focus();
								}
								break;
							}
						}
					}					
				});
			},
			
			eventHander:{
				add: function(event, target, parent){
					Views.table.addRecord();
				},
				remove: function(event, target, parent){
					Views.table.deleteRecord(target);
					 
				},
				mainSelect: function(event, target, parent){
					var subSelect = $(parent).find('select:eq(1)');
					subSelect.html(Model.options(target.value));
				}
			},
			formSubmit: function(){
				Views.table.resetRecordName();
			},
			
			getWeather: function(){
				var city = $("#city").val();
				city = encodeURI(city);
				$("iframe")[0].src = "http://www.webxml.com.cn//WebServices/WeatherWebService.asmx/getWeatherbyCityName?theCityName="+city;
			}
	};
	
	var Views = {
			table:{
				table: $('table'),
				trHtml: "",
				_trHtml: function(){
					this.trHtml =  "<tr>"+$('table tbody tr').first().html() + "</tr>";
				},
				init: function(){
					this._trHtml();
				},
				addRecord:function(){
					this.table.append($(this.trHtml).show());
				},
				deleteRecord:function(target){
					console.log("target:" + target)
					var parent = $(target).parents("tr:eq(0)");
					parent.remove();
				},
				resetRecordName:function(){
					$('tbody').find("tr:gt(0)").each(function(i, ele){
						var $type = $(ele).find('select:eq(0)');
						var $subType = $(ele).find('select:eq(1)');
						
						var $timeStart = $(ele).find('input:eq(0)');
						var $timeStartHour = $(ele).find('input:eq(1)');
						var $timeStartMinutes = $(ele).find('input:eq(2)');
						
						var $timeEnd = $(ele).find('input:eq(3)');
						var $timeEndHour = $(ele).find('input:eq(4)');
						var $timeEndMinutes = $(ele).find('input:eq(5)');
						
						var $desc = $(ele).find('textarea:eq(0)');
						var $id = $(ele).find('input:eq(6)');
						
						$type.attr('name', 'items['+i+'].type');
						$subType.attr('name', 'items['+i+'].subType');
						
						if($timeStartHour.val() == '' || $timeStartMinutes.val() == ''){
							$timeStart.attr('name', '');
						}else{
							$timeStart.val($timeStartHour.val()+":"+$timeStartMinutes.val());
							$timeStart.attr('name', 'items['+i+'].timeStart');
						}
						
						
						if($timeEndHour.val() == '' || $timeEndMinutes.val() == ''){
							$timeEnd.attr('name', '');
						}else{
							$timeEnd.val($timeEndHour.val()+":"+$timeEndMinutes.val());
							$timeEnd.attr('name', 'items['+i+'].timeEnd');
						}
						
						$desc.attr('name', 'items['+i+'].desc');
						$id.attr('name', 'items['+i+'].id');
					});
				},
			}
	};
	
</script>
<script type="text/javascript">

	$(function(){
		Views.table.init();
		Controller.addEventListenerForTable();
		Controller.getWeather();
	});

</script>
</body>
</html>