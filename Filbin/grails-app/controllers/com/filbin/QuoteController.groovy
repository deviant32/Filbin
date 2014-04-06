package com.filbin


import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

/**
 * QuoteController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class QuoteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Quote.list(params), model:[quoteInstanceCount: Quote.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Quote.list(params), model:[quoteInstanceCount: Quote.count()]
    }

    def show(Quote quoteInstance) {
        respond quoteInstance
    }

    def create() {
        respond new Quote(params)
    }

    @Transactional
    def save(Quote quoteInstance) {
        if (quoteInstance == null) {
            notFound()
            return
        }

        if (quoteInstance.hasErrors()) {
            respond quoteInstance.errors, view:'create'
            return
        }

        quoteInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'quoteInstance.label', default: 'Quote'), quoteInstance.id])
                redirect quoteInstance
            }
            '*' { respond quoteInstance, [status: CREATED] }
        }
    }

    def edit(Quote quoteInstance) {
        respond quoteInstance
    }

    @Transactional
    def update(Quote quoteInstance) {
        if (quoteInstance == null) {
            notFound()
            return
        }

        if (quoteInstance.hasErrors()) {
            respond quoteInstance.errors, view:'edit'
            return
        }

        quoteInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Quote.label', default: 'Quote'), quoteInstance.id])
                redirect quoteInstance
            }
            '*'{ respond quoteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Quote quoteInstance) {

        if (quoteInstance == null) {
            notFound()
            return
        }

        quoteInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Quote.label', default: 'Quote'), quoteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'quoteInstance.label', default: 'Quote'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
