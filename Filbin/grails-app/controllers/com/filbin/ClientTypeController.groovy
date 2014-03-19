package com.filbin


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ClientTypeController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class ClientTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ClientType.list(params), model:[clientTypeInstanceCount: ClientType.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ClientType.list(params), model:[clientTypeInstanceCount: ClientType.count()]
    }

    def show(ClientType clientTypeInstance) {
        respond clientTypeInstance
    }

    def create() {
        respond new ClientType(params)
    }

    @Transactional
    def save(ClientType clientTypeInstance) {
        if (clientTypeInstance == null) {
            notFound()
            return
        }

        if (clientTypeInstance.hasErrors()) {
            respond clientTypeInstance.errors, view:'create'
            return
        }

        clientTypeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'clientTypeInstance.label', default: 'ClientType'), clientTypeInstance.id])
                redirect clientTypeInstance
            }
            '*' { respond clientTypeInstance, [status: CREATED] }
        }
    }

    def edit(ClientType clientTypeInstance) {
        respond clientTypeInstance
    }

    @Transactional
    def update(ClientType clientTypeInstance) {
        if (clientTypeInstance == null) {
            notFound()
            return
        }

        if (clientTypeInstance.hasErrors()) {
            respond clientTypeInstance.errors, view:'edit'
            return
        }

        clientTypeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ClientType.label', default: 'ClientType'), clientTypeInstance.id])
                redirect clientTypeInstance
            }
            '*'{ respond clientTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ClientType clientTypeInstance) {

        if (clientTypeInstance == null) {
            notFound()
            return
        }

        clientTypeInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ClientType.label', default: 'ClientType'), clientTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'clientTypeInstance.label', default: 'ClientType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
