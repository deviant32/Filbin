<%@ page import="com.filbin.JobType" %>



			<%--<div class="${hasErrors(bean: jobTypeInstance, field: 'jsonFormText', 'error')} ">
				<label for="jsonFormText" class="control-label"><g:message code="jobType.jsonFormText.label" default="Json Form Text" /></label>
				<div>
					<g:textField class="form-control" name="jsonFormText" value="${jobTypeInstance?.jsonFormText}"/>
					<span class="help-inline">${hasErrors(bean: jobTypeInstance, field: 'jsonFormText', 'error')}</span>
				</div>
			</div>

			--%>
			<div class="${hasErrors(bean: jobTypeInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="jobType.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${jobTypeInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: jobTypeInstance, field: 'name', 'error')}</span>
				</div>
			</div>
			
			<g:hiddenField name="jsonFormText" />
			<div style="height:50px;"></div>
			

