package com.filbin


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ParagraphController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class ParagraphController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Paragraph.list(params), model:[paragraphInstanceCount: Paragraph.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Paragraph.list(params), model:[paragraphInstanceCount: Paragraph.count()]
    }

    def show(Paragraph paragraphInstance) {
        respond paragraphInstance
    }

    def create() {
        respond new Paragraph(params)
    }

    @Transactional
    def save(Paragraph paragraphInstance) {
        if (paragraphInstance == null) {
            notFound()
            return
        }

        if (paragraphInstance.hasErrors()) {
            respond paragraphInstance.errors, view:'create'
            return
        }

        paragraphInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'paragraphInstance.label', default: 'Paragraph'), paragraphInstance.id])
                redirect paragraphInstance
            }
            '*' { respond paragraphInstance, [status: CREATED] }
        }
    }

    def edit(Paragraph paragraphInstance) {
        respond paragraphInstance
    }

    @Transactional
    def update(Paragraph paragraphInstance) {
        if (paragraphInstance == null) {
            notFound()
            return
        }

        if (paragraphInstance.hasErrors()) {
            respond paragraphInstance.errors, view:'edit'
            return
        }

        paragraphInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Paragraph.label', default: 'Paragraph'), paragraphInstance.id])
                redirect paragraphInstance
            }
            '*'{ respond paragraphInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Paragraph paragraphInstance) {

        if (paragraphInstance == null) {
            notFound()
            return
        }

        paragraphInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Paragraph.label', default: 'Paragraph'), paragraphInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'paragraphInstance.label', default: 'Paragraph'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
