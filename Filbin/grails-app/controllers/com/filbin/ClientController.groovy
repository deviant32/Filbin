package com.filbin


import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

import com.amazonaws.services.s3.model.*



/**
 * ClientController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class ClientController {
	
	def amazonWebService
	def aws
	
	//def amazonWebService = ctx.getBean('amazonWebService')

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	String controllerName = "Client";
	
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
			eq('client', clientInstance)
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
	
	def listFiles() {
		params.max = 10
		
		def documentList = Document.createCriteria().list (params) {
			if ( params.query ) {
				
				eq("clientId", "${params.id}")
			}
		}
		[documentInstanceList: documentList, documentInstanceTotal: documentList.count()]
	}
	
	def upload(Client clientInstance) {
		def file = request.getFile('file')
		if(file.empty) {
			flash.message = "File cannot be empty"
		} else {
			def documentInstance = new Document()
			documentInstance.filename = file.originalFilename
			//documentInstance.client = clientInstance;
			documentInstance.client = Client.get(params.getAt("clientId"));
			documentInstance.fullPath = documentInstance.client.getName()+"/"+documentInstance.filename
			
			def uploadedFile = file.inputStream.s3upload(documentInstance.client.getName()+"/"+file.originalFilename) {
				bucket "clientFiles"
			}
			//file.transferTo(new File(documentInstance.fullPath))
			documentInstance.save()
			
			
			
			 
		}
		
		redirect(action: "show", id: params.getAt("clientId"))
	}
	
	def download(long id) {
		Document documentInstance = Document.get(id)
		if ( documentInstance == null) {
			flash.message = "Document not found."
			redirect (action:'listFiles')
		} else {
			def bucket = "clientFiles"
		    
		
		    def fileToDownload = aws.s3().on(bucket).get(documentInstance.getFullPath())
		    response.setContentType("APPLICATION/OCTET-STREAM")
			response.setHeader("Content-Disposition", "Attachment;Filename=\"${documentInstance.filename}\"")

			response.outputStream << fileToDownload.dataInputStream
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
