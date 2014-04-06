package com.filbin

import grails.plugin.springsecurity.annotation.Secured;

class HomeController {
	
	@Secured(['ROLE_ADMIN'])
	def index() {
		List<Client> clients = Client.list(sort:"dateCreated", order:"desc", max:5)
		List<Proposal> proposals = Proposal.list(sort:"dateCreated", order:"desc", max:5)
		[clientList:clients, proposalList:proposals]
	}
}
