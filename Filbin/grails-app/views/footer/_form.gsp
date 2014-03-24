<%@ page import="com.filbin.Footer" %>



			<div class="${hasErrors(bean: footerInstance, field: 'title', 'error')} ">
				<label for="title" class="control-label"><g:message code="footer.title.label" default="Title" /></label>
				<div>
					<g:textField class="form-control" name="title" value="${footerInstance?.title}"/>
					<span class="help-inline">${hasErrors(bean: footerInstance, field: 'title', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: footerInstance, field: 'contents', 'error')} ">
				<label for="contents" class="control-label"><g:message code="footer.contents.label" default="Contents" /></label>
				<div>
					<g:textArea class="form-control" name="contents" cols="40" rows="5" maxlength="2000" value="${footerInstance?.contents}"/>
					<span class="help-inline">${hasErrors(bean: footerInstance, field: 'contents', 'error')}</span>
				</div>
			</div>

