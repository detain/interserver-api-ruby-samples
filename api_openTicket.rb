#!/usr/bin/env ruby
#
# api_openTicket
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This command creates a new ticket in our system.  
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param user_email string 
# @param user_ip string 
# @param subject string 
# @param product string 
# @param body string 
# @param box_auth_value string 
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
	die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_openTicket, message: {})
print response.body[:api_openTicket_response][:return],"\n"