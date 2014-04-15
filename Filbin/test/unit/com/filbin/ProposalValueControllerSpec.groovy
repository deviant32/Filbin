package com.filbin



import grails.test.mixin.*
import spock.lang.*

@TestFor(ProposalValueController)
@Mock(ProposalValue)
class ProposalValueControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.proposalValueInstanceList
            model.proposalValueInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.proposalValueInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def proposalValue = new ProposalValue()
            proposalValue.validate()
            controller.save(proposalValue)

        then:"The create view is rendered again with the correct model"
            model.proposalValueInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            proposalValue = new ProposalValue(params)

            controller.save(proposalValue)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/proposalValue/show/1'
            controller.flash.message != null
            ProposalValue.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def proposalValue = new ProposalValue(params)
            controller.show(proposalValue)

        then:"A model is populated containing the domain instance"
            model.proposalValueInstance == proposalValue
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def proposalValue = new ProposalValue(params)
            controller.edit(proposalValue)

        then:"A model is populated containing the domain instance"
            model.proposalValueInstance == proposalValue
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/proposalValue/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def proposalValue = new ProposalValue()
            proposalValue.validate()
            controller.update(proposalValue)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.proposalValueInstance == proposalValue

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            proposalValue = new ProposalValue(params).save(flush: true)
            controller.update(proposalValue)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/proposalValue/show/$proposalValue.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/proposalValue/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def proposalValue = new ProposalValue(params).save(flush: true)

        then:"It exists"
            ProposalValue.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(proposalValue)

        then:"The instance is deleted"
            ProposalValue.count() == 0
            response.redirectedUrl == '/proposalValue/index'
            flash.message != null
    }
}
