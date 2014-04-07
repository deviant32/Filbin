package com.filbin


import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

/**
 * ProposalController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class ProposalController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Proposal.list(params), model:[proposalInstanceCount: Proposal.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Proposal.list(params), model:[proposalInstanceCount: Proposal.count()]
    }

    def show(Proposal proposalInstance) {
        respond proposalInstance
    }
	
	def getJson(Proposal proposalInstance) {
		render proposalInstance.jobTypes as JSON
	}

    def create() {
        respond new Proposal(params)
    }
	
	@Transactional
	def saveData(){
		params.each { name, value ->
			log.println name
		}
		return
	}

    @Transactional
    def save(Proposal proposalInstance) {
        if (proposalInstance == null) {
            notFound()
            return
        }

        if (proposalInstance.hasErrors()) {
            respond proposalInstance.errors, view:'create'
            return
        }

        proposalInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'proposalInstance.label', default: 'Proposal'), proposalInstance.id])
                redirect proposalInstance
            }
            '*' { respond proposalInstance, [status: CREATED] }
        }
    }

    def edit(Proposal proposalInstance) {
        respond proposalInstance
    }

    @Transactional
    def update(Proposal proposalInstance) {
        if (proposalInstance == null) {
            notFound()
            return
        }

        if (proposalInstance.hasErrors()) {
            respond proposalInstance.errors, view:'edit'
            return
        }

        proposalInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Proposal.label', default: 'Proposal'), proposalInstance.id])
                redirect proposalInstance
            }
            '*'{ respond proposalInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Proposal proposalInstance) {

        if (proposalInstance == null) {
            notFound()
            return
        }

        proposalInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Proposal.label', default: 'Proposal'), proposalInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'proposalInstance.label', default: 'Proposal'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
