#!/usr/bin/env ruby
#
# api_viewTicket
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# View/Retrieve information about the given ticketID.
#
# @param sid string the *Session ID* you get from the [login](#login) call
# @param ticketID string the id of the ticket to retrieve. you can use [getTicketList](#getticketlist) to get a list of your tickets
#
require 'savon'

client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')
response = client.call(
	:api_login, message: {
		username: ARGV[0],
		password: ARGV[1]
})
sid = response.body[:api_login_response][:return]
if (sid == "")
	die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(
	:api_viewTicket, message: { 
		sid: ARGV[0], 
		ticketID: ARGV[1], 
})
print response.body[:api_viewTicket_response][:return],"\n"
