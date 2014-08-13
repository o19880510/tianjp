<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../common/common_tags.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>新增权限</title>
</head>
<body>
<div id="accordion" class="accordion">
	<div class="accordion-group">
		<div class="accordion-heading">
			<a href="#addAccordion" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion">
				<i class="icon-th-large icon-white"></i>
				<span>新增权限</span>
				<i class="icon-chevron-down icon-white pull-right"></i>
			</a>
		</div>
		<div id="addAccordion" class="accordion-body in">
			<div class="accordion-inner">
				<form:form action="add.do" modelAttribute="privilege" method="post" cssClass="form-horizontal">
					<c:set var="groupError"><form:errors path="group"></form:errors></c:set>
					<c:set var="nameError"><form:errors path="name"></form:errors></c:set>
					<c:set var="uriError"><form:errors path="uri"></form:errors></c:set>
					<div class="control-group${not empty groupError?' error':''}">
						<label class="control-label" for="group">权限组名</label>
						<div class="controls">
							<form:input path="group" maxlength="20"/>
							<span class="help-inline">${empty groupError?'用于对权限进行分类':groupError}</span>
						</div>
					</div>
					<div class="control-group${not empty nameError?' error':''}">
						<label class="control-label" for="name">权限名</label>
						<div class="controls">
							<form:input path="name" maxlength="20"></form:input>
							<span class="help-inline">${nameError}</span>
						</div>
					</div>
					<div class="control-group${not empty uriError?' error':''}">
						<label class="control-label" for="uri">资源URI</label>
						<div class="controls">
							<form:textarea path="uri" cssClass="span6" rows="5"/>
							<span class="help-inline">${empty uriError?'受权限保护的URI,如：privilege/add':uriError}</span>
						</div>
					</div>
					<div class="form-actions">
						<button class="btn btn-primary" type="submit">提交</button>
						<button class="btn" type="reset">重置</button>
						<a href="${returnURI}" class="btn">返回</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

jQuery.validator.addMethod("protected_uri", function(value, element) { 
  return /^[a-zA-Z0-9\?\\\/\+\.=&\-\_]+$/.test(value); 
});

$('#privilege').validate({
	rules:{
		group: 'required',
		name:'required',
		uri: {
			maxlength:256,
			protected_uri:true
		}
	},
	messages:{
		group:'<spring:message code="privilege.group.required"/>',
		name:'<spring:message code="privilege.name.required"/>',
		uri: {
			maxlength:'<spring:message code="privilege.uri.max"/>',
			protected_uri:'<spring:message code="privilege.uri.invalid"/>'
		}
	},
	onfocusout: function(element) {
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
</script>
</body>
</html>