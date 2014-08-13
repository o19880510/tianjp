<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../common/common_tags.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>新增参数</title>
</head>
<body>
<div id="accordion" class="accordion">
	<div class="accordion-group">
		<div class="accordion-heading">
			<a href="#addAccordion" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion">
				<i class="icon-th-large icon-white"></i>
				<span>新增参数</span>
				<i class="icon-chevron-down icon-white pull-right"></i>
			</a>
		</div>
		<div id="addAccordion" class="accordion-body in">
			<div class="accordion-inner">
				<form:form action="add.do" method="post" modelAttribute="PARAM" cssClass="form-horizontal">
					<c:set var="nameError"><form:errors path="name"/></c:set>
					<c:set var="descriptionError"><form:errors path="description"/></c:set>
					<div class="control-group${empty nameError?'':' error'}">
						<label class="control-label" for="name">参数名</label>
						<div class="controls">
							<form:input path="name" maxlength="50"/>
							<span class="help-inline">${empty nameError?'只能输入字母、数字、下划线':nameError}</span>
						</div>
					</div>
					<div class="control-group${empty descriptionError?'':' error'}">
						<label class="control-label" for="description">参数说明</label>
						<div class="controls">
							<form:input path="description" maxlength="100" cssClass="input-xxlarge"/>
							<span class="help-inline">${descriptionError}</span>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>键</th>
										<th>值</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${PARAM.items}" var="item" varStatus="vs">
										<tr>
											<td>
												<form:input title="${PARAM.items[vs.index].name}" path="items[${vs.index}].name" cssStyle="width:90%"/>
												<span class="help-block"><form:errors path="items[${vs.index}].name"/></span>
											</td>
											<td>
												<form:input title="${PARAM.items[vs.index].value}" path="items[${vs.index}].value" cssStyle="width:90%"/>
												<span class="help-block"><form:errors path="items[${vs.index}].value"/></span>
											</td>
											<td>
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
						<button type="submit" class="btn btn-primary">提交</button>
						<button type="reset" class="btn">重置</button>
						<a href="${returnURI}" class="btn">返回</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
jQuery.validator.addMethod('param', function(value, element){
	return /^[a-zA-Z]+[a-zA-Z0-9_]*$/.test(value);
});
$('#PARAM').validate({
	rules:{
		name:{
			required:true,
			param:true
		}
	},
	messages:{
		name:{
			required:'参数名不能为空',
			param:'参数名无效'
		}
	},
	onfocusout: function(element){
		$(element).valid();
	},
	errorElement: 'span',
    errorClass: 'help-inline',
   	highlight: function(element, errorClass) {
    	$(element).parents('.control-group').addClass('error');
  	},
  	unhighlight: function(element, errorClass, validClass) {
    	$(element).parents('.control-group').removeClass('error');
  	}
});

function resetIndex(){
	$('tbody tr').each(function(i, ele){
		var $name = $(ele).find('input:eq(0)');
		var $value = $(ele).find('input:eq(1)');
		$name.attr('name', 'items['+i+'].name');
		$value.attr('name', 'items['+i+'].value');
	});
}

$('.add').live('click',function(){
	var size = $('tbody tr').size();
	var html = '<tr>';
		html +='<td><input type="text" name="items['+size+'].name" style="width:90%"/></td>';
		html +='<td><input type="text" name="items['+size+'].value" style="width:90%"/></td>';
		html +='<td><a href="#" class="add btn">添加</a><a href="#" class="remove btn">删除</a></td>';
		html +='</tr>';
		$(this).parents('tr').after(html);
		resetIndex();
	return false;
});

$('.remove').live('click',function(){
	var size = $('tbody tr').size();
	if(size>1){
		$(this).parents('tr').remove();
	}
	resetIndex();
	return false;
});
</script>
</body>
</html>