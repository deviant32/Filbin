<%@ page import="com.filbin.Paragraph" %>



			<div class="${hasErrors(bean: paragraphInstance, field: 'contents', 'error')} ">
				<label for="contents" class="control-label"><g:message code="paragraph.contents.label" default="Contents" /></label>
				<div>
					<g:textArea class="form-control" name="contents" cols="40" rows="5" maxlength="2000" value="${paragraphInstance?.contents}"/>
					<span class="help-inline">${hasErrors(bean: paragraphInstance, field: 'contents', 'error')}</span>
				</div>
			</div>

