#!/usr/bin/env ruby
#
# api_quickservers_get_client_invoices
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This Function Applies to the QuickServers services.
# Gets a list of all the invoices.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
  die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_quickservers_get_client_invoices, message: {})
print response.body[:api_quickservers_get_client_invoices_response][:return],"\n"