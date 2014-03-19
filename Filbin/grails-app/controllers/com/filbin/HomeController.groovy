package com.filbin

class HomeController {

	def index() {
		List<Client> clients = Client.list(sort:"dateCreated", order:"desc", max:5)
		List<Proposal> proposals = Proposal.list(sort:"dateCreated", order:"desc", max:5)
		[clientList:clients, proposalList:proposals]
	}
}
