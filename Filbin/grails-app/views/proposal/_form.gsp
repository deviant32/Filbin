<%@ page import="com.filbin.Proposal" %>


			<div class="${hasErrors(bean: proposalInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="proposal.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="name" value="${proposalInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: proposalInstance, field: 'name', 'error')}</span>
				</div>
			</div>
			
			<div class="${hasErrors(bean: proposalInstance, field: 'client', 'error')} required">
				<label for="client" class="control-label"><g:message code="proposal.client.label" default="Client" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="client" name="client.id" from="${com.filbin.Client.list()}" optionKey="id" required="" value="${proposalInstance?.client?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: proposalInstance, field: 'client', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: proposalInstance, field: 'jobTypes', 'error')} ">
				<label for="jobTypes" class="control-label"><g:message code="proposal.jobTypes.label" default="Job Types" /></label>
				<div>
					<g:select class="form-control" name="jobTypes" from="${com.filbin.JobType.list()}" multiple="multiple" optionKey="id" size="5" value="${proposalInstance?.jobTypes*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: proposalInstance, field: 'jobTypes', 'error')}</span>
				</div>
			</div>

