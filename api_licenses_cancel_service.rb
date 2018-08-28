#!/usr/bin/env ruby
#
# api_licenses_cancel_service
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This Function Applies to the Licensing services.
# Cancels a service for the passed module matching the passed id.  Canceling a
# service will also cancel any addons for that service at the same time.
#
# @param sid string the *Session ID* you get from the [login](#login) call
# @param id int ID / Service ID you wish to cancel
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
	:api_licenses_cancel_service, message: { 
		sid: ARGV[0], 
		id: ARGV[1], 
})
print response.body[:api_licenses_cancel_service_response][:return],"\n"
