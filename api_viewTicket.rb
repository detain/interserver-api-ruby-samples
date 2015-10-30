#!/usr/bin/env ruby
#
# api_viewTicket
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# View/Retrieve information about the given ticketID.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param ticketID string the id of the ticket to retrieve. you can use [api_getTicketList](#api_getTicketList) to get a list of your tickets
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
  die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_viewTicket, message: {})
print response.body[:api_viewTicket_response][:return],"\n"