<%@ page import="com.filbin.Quote" %>

			<div class="${hasErrors(bean: quoteInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="quote.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${quoteInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: quoteInstance, field: 'name', 'error')}</span>
				</div>
			</div>


			<div class="${hasErrors(bean: quoteInstance, field: 'proposal', 'error')} required">
				<label for="proposal" class="control-label"><g:message code="quote.proposal.label" default="Proposal" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="proposal" name="proposal.id" from="${com.filbin.Proposal.list()}" optionKey="id" required="" value="${quoteInstance?.proposal?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: quoteInstance, field: 'proposal', 'error')}</span>
				</div>
			</div>
			
			<div class="${hasErrors(bean: quoteInstance, field: 'letterHead', 'error')} required">
				<label for="letterHead" class="control-label"><g:message code="quote.letterHead.label" default="Letter Head" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="letterHead" name="letterHead.id" from="${com.filbin.LetterHead.list()}" optionKey="id" required="" value="${quoteInstance?.letterHead?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: quoteInstance, field: 'letterHead', 'error')}</span>
				</div>
			</div>
			
			<div class="${hasErrors(bean: quoteInstance, field: 'footer', 'error')} required">
				<label for="letterHead" class="control-label"><g:message code="quote.letterHead.label" default="Footer" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="letterHead" name="letterHead.id" from="${com.filbin.Footer.list()}" optionKey="id" required="" value="${quoteInstance?.footer?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: quoteInstance, field: 'footer', 'error')}</span>
				</div>
			</div>
			
			

