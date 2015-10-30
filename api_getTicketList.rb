#!/usr/bin/env ruby
#
# api_getTicketList
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Returns a list of any tickets in the system.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param page int page number of tickets to list
# @param limit int how many tickets to show per page
# @param status string null for no status limi t or limit to a speicifc status
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
  die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_getTicketList, message: {})
print response.body[:api_getTicketList_response][:return],"\n"