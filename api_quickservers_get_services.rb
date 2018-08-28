#!/usr/bin/env ruby
#
# api_quickservers_get_services
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This Function Applies to the Rapid Deploy Servers services.
# Gets List of Services
#
# @param sid string the *Session ID* you get from the [login](#login) call
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
	:api_quickservers_get_services, message: { 
		sid: ARGV[0], 
})
print response.body[:api_quickservers_get_services_response][:return],"\n"
