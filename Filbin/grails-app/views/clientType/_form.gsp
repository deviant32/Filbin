<%@ page import="com.filbin.ClientType" %>



			<div class="${hasErrors(bean: clientTypeInstance, field: 'type', 'error')} required">
				<label for="type" class="control-label"><g:message code="clientType.type.label" default="Type" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="type" required="" value="${clientTypeInstance?.type}"/>
					<span class="help-inline">${hasErrors(bean: clientTypeInstance, field: 'type', 'error')}</span>
				</div>
			</div>

