package com.filbin


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * LetterHeadController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class LetterHeadController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LetterHead.list(params), model:[letterHeadInstanceCount: LetterHead.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LetterHead.list(params), model:[letterHeadInstanceCount: LetterHead.count()]
    }

    def show(LetterHead letterHeadInstance) {
        respond letterHeadInstance
    }

    def create() {
        respond new LetterHead(params)
    }

    @Transactional
    def save(LetterHead letterHeadInstance) {
        if (letterHeadInstance == null) {
            notFound()
            return
        }

        if (letterHeadInstance.hasErrors()) {
            respond letterHeadInstance.errors, view:'create'
            return
        }

        letterHeadInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'letterHeadInstance.label', default: 'LetterHead'), letterHeadInstance.id])
                redirect letterHeadInstance
            }
            '*' { respond letterHeadInstance, [status: CREATED] }
        }
    }

    def edit(LetterHead letterHeadInstance) {
        respond letterHeadInstance
    }

    @Transactional
    def update(LetterHead letterHeadInstance) {
        if (letterHeadInstance == null) {
            notFound()
            return
        }

        if (letterHeadInstance.hasErrors()) {
            respond letterHeadInstance.errors, view:'edit'
            return
        }

        letterHeadInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LetterHead.label', default: 'LetterHead'), letterHeadInstance.id])
                redirect letterHeadInstance
            }
            '*'{ respond letterHeadInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LetterHead letterHeadInstance) {

        if (letterHeadInstance == null) {
            notFound()
            return
        }

        letterHeadInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LetterHead.label', default: 'LetterHead'), letterHeadInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'letterHeadInstance.label', default: 'LetterHead'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
