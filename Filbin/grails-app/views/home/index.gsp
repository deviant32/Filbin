<html>

<head>
	<title><g:message code="default.welcome.title" args="[meta(name:'app.name')]"/> </title>
	<meta name="layout" content="kickstart" />
</head>

<body>
<div style="margin-bottom:60px !important;">
	<h2>Recent Clients</h2>
	<table class="table table-bordered margin-top-medium">
      <thead>
        <tr>
          <th class="sortable">Name</th>
          <th class="sortable">Phone Number</th>
          <th class="sortable">Email Address</th>
          <th class="sortable">Date Added</th>
        </tr>
      </thead>
      <tbody>
      	<g:each in="${clientList}" status="i" var="client">
      		<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<td><g:link action="show" controller="client" id="${client.id}">${client.name}</g:link></td>
				<td>${client.phoneNumber}</td>
				<td>${client.emailAddress}</td>
				<td><g:formatDate date="${client.dateCreated}" type="datetime" style="SHORT"/></td>
			<tr>
		</g:each>
      </tbody>
    </table>
</div>
<div>
    <h2>Recent Proposals</h2>
    <table class="table table-bordered margin-top-medium">
      <thead>
        <tr>
          <th class="sortable">Name</th>
          <th class="sortable">Date Added</th>
          <th class="sortable">Date Updated</th>
        </tr>
      </thead>
      <tbody>
      	<g:each in="${proposalList}" status="i" var="proposal">
      		<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<td><g:link action="show" controller="proposal" id="${proposal.id}">${proposal.name}</g:link></td>
				<td><g:formatDate date="${proposal.dateCreated}" type="datetime" style="SHORT"/></td>
				<td><g:formatDate date="${proposal.lastUpdated}" type="datetime" style="SHORT"/></td>
			<tr>
		</g:each>
      </tbody>
    </table>
</div>
	
	

</body>

</html>
