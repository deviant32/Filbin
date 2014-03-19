<%@ page import="com.filbin.Client" %>



			<div class="${hasErrors(bean: clientInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="client.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="name" required="" value="${clientInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: clientInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: clientInstance, field: 'emailAddress', 'error')} ">
				<label for="emailAddress" class="control-label"><g:message code="client.emailAddress.label" default="Email Address" /></label>
				<div>
					<g:field class="form-control" type="email" name="emailAddress" value="${clientInstance?.emailAddress}"/>
					<span class="help-inline">${hasErrors(bean: clientInstance, field: 'emailAddress', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: clientInstance, field: 'notes', 'error')} ">
				<label for="notes" class="control-label"><g:message code="client.notes.label" default="Notes" /></label>
				<div>
					<g:textArea class="form-control" name="notes" cols="40" rows="5" maxlength="2000" value="${clientInstance?.notes}"/>
					<span class="help-inline">${hasErrors(bean: clientInstance, field: 'notes', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: clientInstance, field: 'address', 'error')} ">
				<label for="address" class="control-label"><g:message code="client.address.label" default="Address" /></label>
				<div>
					<g:textField class="form-control" name="address" value="${clientInstance?.address}"/>
					<span class="help-inline">${hasErrors(bean: clientInstance, field: 'address', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: clientInstance, field: 'phoneNumber', 'error')} ">
				<label for="phoneNumber" class="control-label"><g:message code="client.phoneNumber.label" default="Phone Number" /></label>
				<div>
					<g:textField class="form-control" name="phoneNumber" value="${clientInstance?.phoneNumber}"/>
					<span class="help-inline">${hasErrors(bean: clientInstance, field: 'phoneNumber', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: clientInstance, field: 'test', 'error')} ">
				<label for="test" class="control-label"><g:message code="client.test.label" default="Test" /></label>
				<div>
					<g:textField class="form-control" name="test" value="${clientInstance?.test}"/>
					<span class="help-inline">${hasErrors(bean: clientInstance, field: 'test', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: clientInstance, field: 'type', 'error')} required">
				<label for="type" class="control-label"><g:message code="client.type.label" default="Type" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="type" name="type.id" from="${com.filbin.ClientType.list()}" optionKey="id" required="" value="${clientInstance?.type?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: clientInstance, field: 'type', 'error')}</span>
				</div>
			</div>

