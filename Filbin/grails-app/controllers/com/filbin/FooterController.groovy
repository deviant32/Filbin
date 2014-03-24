package com.filbin


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * FooterController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class FooterController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Footer.list(params), model:[footerInstanceCount: Footer.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Footer.list(params), model:[footerInstanceCount: Footer.count()]
    }

    def show(Footer footerInstance) {
        respond footerInstance
    }

    def create() {
        respond new Footer(params)
    }

    @Transactional
    def save(Footer footerInstance) {
        if (footerInstance == null) {
            notFound()
            return
        }

        if (footerInstance.hasErrors()) {
            respond footerInstance.errors, view:'create'
            return
        }

        footerInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'footerInstance.label', default: 'Footer'), footerInstance.id])
                redirect footerInstance
            }
            '*' { respond footerInstance, [status: CREATED] }
        }
    }

    def edit(Footer footerInstance) {
        respond footerInstance
    }

    @Transactional
    def update(Footer footerInstance) {
        if (footerInstance == null) {
            notFound()
            return
        }

        if (footerInstance.hasErrors()) {
            respond footerInstance.errors, view:'edit'
            return
        }

        footerInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Footer.label', default: 'Footer'), footerInstance.id])
                redirect footerInstance
            }
            '*'{ respond footerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Footer footerInstance) {

        if (footerInstance == null) {
            notFound()
            return
        }

        footerInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Footer.label', default: 'Footer'), footerInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'footerInstance.label', default: 'Footer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
