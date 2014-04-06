package com.filbin


import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

/**
 * JobTypeController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class JobTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond JobType.list(params), model:[jobTypeInstanceCount: JobType.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond JobType.list(params), model:[jobTypeInstanceCount: JobType.count()]
    }

    def show(JobType jobTypeInstance) {
        respond jobTypeInstance
    }

    def create() {
        respond new JobType(params)
    }

    @Transactional
    def save(JobType jobTypeInstance) {
        if (jobTypeInstance == null) {
            notFound()
            return
        }

        if (jobTypeInstance.hasErrors()) {
            respond jobTypeInstance.errors, view:'create'
            return
        }

        jobTypeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'jobTypeInstance.label', default: 'JobType'), jobTypeInstance.id])
                redirect jobTypeInstance
            }
            '*' { respond jobTypeInstance, [status: CREATED] }
        }
    }

    def edit(JobType jobTypeInstance) {
        respond jobTypeInstance
    }
	
	def getJobTypeById(JobType jobTypeInstance){
		render jobTypeInstance as JSON
	}

    @Transactional
    def update(JobType jobTypeInstance) {
        if (jobTypeInstance == null) {
            notFound()
            return
        }

        if (jobTypeInstance.hasErrors()) {
            respond jobTypeInstance.errors, view:'edit'
            return
        }

        jobTypeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'JobType.label', default: 'JobType'), jobTypeInstance.id])
                redirect jobTypeInstance
            }
            '*'{ respond jobTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(JobType jobTypeInstance) {

        if (jobTypeInstance == null) {
            notFound()
            return
        }

        jobTypeInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'JobType.label', default: 'JobType'), jobTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'jobTypeInstance.label', default: 'JobType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
