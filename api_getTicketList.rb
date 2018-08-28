#!/usr/bin/env ruby
#
# api_getTicketList
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Returns a list of any tickets in the system.
#
# @param sid string the *Session ID* you get from the [login](#login) call
# @param page int page number of tickets to list
# @param limit int how many tickets to show per page
# @param status string null for no status limit or limit to a specific status
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
	:api_getTicketList, message: { 
		sid: ARGV[0], 
		page: ARGV[1], 
		limit: ARGV[2], 
		status: ARGV[3], 
})
print response.body[:api_getTicketList_response][:return],"\n"
