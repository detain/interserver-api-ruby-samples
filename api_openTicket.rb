#!/usr/bin/env ruby
#
# api_openTicket
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This command creates a new ticket in our system.
#
# @param sid string the *Session ID* you get from the [login](#login) call
# @param user_email string client email address
# @param user_ip string client ip address
# @param subject string subject of the ticket
# @param product string the product/service if any this is in reference to.
# @param body string full content/description for the ticket
# @param box_auth_value string encryption string?
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
	:api_openTicket, message: { 
		sid: ARGV[0], 
		user_email: ARGV[1], 
		user_ip: ARGV[2], 
		subject: ARGV[3], 
		product: ARGV[4], 
		body: ARGV[5], 
		box_auth_value: ARGV[6], 
})
print response.body[:api_openTicket_response][:return],"\n"
