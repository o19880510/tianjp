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
				<form:form id="diet" action="add.do" method="post" modelAttribute="newDietReq" cssClass="form-horizontal">
					
					<div class="control-group">
						<label class="control-label">时间</label>
						<div class="controls">
							<input name="day" class="input-middle Wdate" onclick="WdatePicker()"/>
						</div>
					</div>
					
					
					<div class="control-group">
						<label class="control-label">天气</label>
						<div class="controls">
							<select name="city" style="width: 80px;">
								<codetable:option table="<%=ParamConstants.CITY %>"/>
							</select>
							<input name="weather" class="input-small"/>&nbsp;&nbsp;&nbsp;
							<input name="temperature" class="input-small"/>&nbsp;&nbsp;&nbsp;
							<a href="add.do" class="btn">获取</a>
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
											<select style="width: 80px;" class="main">
												<codetable:option table="<%=ParamConstants.BEHAVIOR_TYPE %>" selectIndex="1"/>
											</select>
										</td>
										<td>
										
											<select style="width: 130px;">
												<option>---Empty---</option>
												<codetable:option table="<codetable:out table='<%=ParamConstants.BEHAVIOR_TYPE %>' selectIndex='1'/>"/>
											</select>
										</td>
										<td>
											<input type="hidden" name="timeStart"/>
											<input maxlength="2" style="width: 23px;" />：
											<input maxlength="2" style="width: 23px;" />
										</td>
										<td>
											<input type="hidden" name="timeEnd"/>
											<input maxlength="2" style="width: 23px;" />：
											<input maxlength="2" style="width: 23px;" />
										</td>
										<td>
											<textarea rows="4" cols="30"></textarea>
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
						<button type="submit" onclick="Controller.formSubmit()" class="btn btn-primary">提交</button>
						<button type="reset" class="btn">重置</button>
						<a href="history.go(-1);" class="btn">返回</a>
						<a href="javascript:Controller.formSubmit();" class="btn">返回</a>
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
				
				return false;
			},
			
			init:{
				date: function(){
					console.log("date:" + $("input[name=day]").length)
					$("input[name=day]").val(new Date().format("yyyy-MM-dd"));
				}
			}
	};
	
	var Views = {
			table:{
				table: $('table'),
				trHtml: "",
				_trHtml: function(){
					this.trHtml =  "<tr>"+$('table tbody tr').first().html() + "</tr>";
				},
				subTypeInit: function(){
					var type = $('table tbody tr').first().find('select:eq(0)').val();
					var $subType = $('table tbody tr').first().find('select:eq(1)');
					$subType.html(Model.options(type));
					
					this._trHtml();
				},
				addRecord:function(){
					this.table.append(this.trHtml);
				},
				deleteRecord:function(target){
					console.log("target:" + target)
					var parent = $(target).parents("tr:eq(0)");
					parent.remove();
				},
				resetRecordName:function(){
					$('tbody tr').each(function(i, ele){
						var $type = $(ele).find('select:eq(0)');
						var $subType = $(ele).find('select:eq(1)');
						
						var $timeStart = $(ele).find('input:eq(0)');
						var $timeStartHour = $(ele).find('input:eq(1)');
						var $timeStartMinutes = $(ele).find('input:eq(2)');
						
						var $timeEnd = $(ele).find('input:eq(3)');
						var $timeEndHour = $(ele).find('input:eq(4)');
						var $timeEndMinutes = $(ele).find('input:eq(5)');
						
						var $desc = $(ele).find('textarea:eq(0)');
						
						$type.attr('name', 'items['+i+'].type');
						$subType.attr('name', 'items['+i+'].subType');
						
						$timeStart.val($timeStartHour.val()+":"+$timeStartMinutes.val());
						$timeStart.attr('name', 'items['+i+'].timeStart');
						
						$timeEnd.val($timeEndHour.val()+":"+$timeEndMinutes.val());
						$timeEnd.attr('name', 'items['+i+'].timeEnd');
						
						$desc.attr('name', 'items['+i+'].desc');
					});
				},
			}
	};
	
</script>
<script type="text/javascript">

// Controller.addEventListenerForTable1();
	$(function(){
		Views.table.subTypeInit();
		Controller.addEventListenerForTable();
		Controller.init.date();
	});

</script>
</body>
</html>