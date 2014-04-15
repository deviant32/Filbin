<%@ page import="com.filbin.ProposalValue" %>



			<div class="${hasErrors(bean: proposalValueInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="proposalValue.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="name" required="" value="${proposalValueInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: proposalValueInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: proposalValueInstance, field: 'value', 'error')} required">
				<label for="value" class="control-label"><g:message code="proposalValue.value.label" default="Value" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="value" required="" value="${proposalValueInstance?.value}"/>
					<span class="help-inline">${hasErrors(bean: proposalValueInstance, field: 'value', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: proposalValueInstance, field: 'proposal', 'error')} required">
				<label for="proposal" class="control-label"><g:message code="proposalValue.proposal.label" default="Proposal" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="proposal" name="proposal.id" from="${com.filbin.Proposal.list()}" optionKey="id" required="" value="${proposalValueInstance?.proposal?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: proposalValueInstance, field: 'proposal', 'error')}</span>
				</div>
			</div>

