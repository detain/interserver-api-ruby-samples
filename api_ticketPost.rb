#!/usr/bin/env ruby
#
# api_ticketPost
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This commands adds the content parameter as a response/reply to an existing
# ticket specified by ticketID.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param ticketID string 
# @param content string 
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
	die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_ticketPost, message: {})
print response.body[:api_ticketPost_response][:return],"\n"