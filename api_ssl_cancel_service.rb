#!/usr/bin/env ruby
#
# api_ssl_cancel_service
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This Function Applies to the SSL Certificates services.
# Cancels a service for the passed module matching the passed id.  Canceling a
# service will also cancel any addons for that service at the same time.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param id int the Order ID / Service ID you wish to cancel
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
	die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_ssl_cancel_service, message: {})
print response.body[:api_ssl_cancel_service_response][:return],"\n"