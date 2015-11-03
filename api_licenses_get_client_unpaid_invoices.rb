#!/usr/bin/env ruby
#
# api_licenses_get_client_unpaid_invoices
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This Function Applies to the Licensing services.
# This function returns a list of all the unpaid invoices matching the module
# passed..
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
#
require 'savon'

client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')

response = client.call(:api_login, message: {username: ARGV[0],password: ARGV[1]})
sid = response.body[:api_login_response][:return]
if (sid == "")
  die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_licenses_get_client_unpaid_invoices, message: {
 
  sid: ARGV[0],} )
print response.body[:api_licenses_get_client_unpaid_invoices_response][:return],"\n"