package com.filbin


import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

/**
 * ProposalValueController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class ProposalValueController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ProposalValue.list(params), model:[proposalValueInstanceCount: ProposalValue.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ProposalValue.list(params), model:[proposalValueInstanceCount: ProposalValue.count()]
    }

    def show(ProposalValue proposalValueInstance) {
        respond proposalValueInstance
    }

    def create() {
        respond new ProposalValue(params)
    }

    @Transactional
    def save(ProposalValue proposalValueInstance) {
        if (proposalValueInstance == null) {
            notFound()
            return
        }

        if (proposalValueInstance.hasErrors()) {
            respond proposalValueInstance.errors, view:'create'
            return
        }

        proposalValueInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'proposalValueInstance.label', default: 'ProposalValue'), proposalValueInstance.id])
                redirect proposalValueInstance
            }
            '*' { respond proposalValueInstance, [status: CREATED] }
        }
    }

    def edit(ProposalValue proposalValueInstance) {
        respond proposalValueInstance
    }

    @Transactional
    def update(ProposalValue proposalValueInstance) {
        if (proposalValueInstance == null) {
            notFound()
            return
        }

        if (proposalValueInstance.hasErrors()) {
            respond proposalValueInstance.errors, view:'edit'
            return
        }

        proposalValueInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ProposalValue.label', default: 'ProposalValue'), proposalValueInstance.id])
                redirect proposalValueInstance
            }
            '*'{ respond proposalValueInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ProposalValue proposalValueInstance) {

        if (proposalValueInstance == null) {
            notFound()
            return
        }

        proposalValueInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ProposalValue.label', default: 'ProposalValue'), proposalValueInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'proposalValueInstance.label', default: 'ProposalValue'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
