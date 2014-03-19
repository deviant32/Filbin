package com.filbin


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ClientController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class ClientController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Client.list(params), model:[clientInstanceCount: Client.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Client.list(params), model:[clientInstanceCount: Client.count()]
    }

    def show(Client clientInstance) {
		def criteria = Proposal.createCriteria() 
		def proposalList = criteria.list(){
			eq('id', clientInstance.id)
		}
		
        [clientInstance: clientInstance, proposalList : proposalList]
    }

    def create() {
        respond new Client(params)
    }
	
	def search() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)

		def clientList = Client.createCriteria().list (params) {
			if ( params.query ) {
				ilike("name", "%${params.query}%")
			}
		}
		[clientInstanceList: clientList, clientInstanceCount: clientList.size()]
	}


    @Transactional
    def save(Client clientInstance) {
        if (clientInstance == null) {
            notFound()
            return
        }

        if (clientInstance.hasErrors()) {
            respond clientInstance.errors, view:'create'
            return
        }

        clientInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'clientInstance.label', default: 'Client'), clientInstance.id])
                redirect clientInstance
            }
            '*' { respond clientInstance, [status: CREATED] }
        }
    }

    def edit(Client clientInstance) {
        respond clientInstance
    }

    @Transactional
    def update(Client clientInstance) {
        if (clientInstance == null) {
            notFound()
            return
        }

        if (clientInstance.hasErrors()) {
            respond clientInstance.errors, view:'edit'
            return
        }

        clientInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Client.label', default: 'Client'), clientInstance.id])
                redirect clientInstance
            }
            '*'{ respond clientInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Client clientInstance) {

        if (clientInstance == null) {
            notFound()
            return
        }

        clientInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Client.label', default: 'Client'), clientInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'clientInstance.label', default: 'Client'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
