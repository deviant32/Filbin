<%@ page import="com.filbin.LetterHead" %>



			<div class="${hasErrors(bean: letterHeadInstance, field: 'title', 'error')} ">
				<label for="title" class="control-label"><g:message code="letterHead.title.label" default="Title" /></label>
				<div>
					<g:textField class="form-control" name="title" value="${letterHeadInstance?.title}"/>
					<span class="help-inline">${hasErrors(bean: letterHeadInstance, field: 'title', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: letterHeadInstance, field: 'contents', 'error')} ">
				<label for="contents" class="control-label"><g:message code="letterHead.contents.label" default="Contents" /></label>
				<div>
					<g:textArea class="form-control" name="contents" cols="40" rows="5" maxlength="2000" value="${letterHeadInstance?.contents}"/>
					<span class="help-inline">${hasErrors(bean: letterHeadInstance, field: 'contents', 'error')}</span>
				</div>
			</div>

