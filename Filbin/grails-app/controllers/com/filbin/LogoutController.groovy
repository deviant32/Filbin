package com.filbin

import javax.servlet.http.HttpServletResponse;

import grails.plugin.springsecurity.SpringSecurityUtils;
import grails.plugin.springsecurity.annotation.Secured;

/**
 * LogoutController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured('permitAll')
class LogoutController {

	/**
	 * Index action. Redirects to the Spring security logout uri.
	 */
	def index() {

		
	}
}
