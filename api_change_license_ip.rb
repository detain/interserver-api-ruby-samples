#!/usr/bin/env ruby
#
# api_change_license_ip
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Change the IP on an active license.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param oldip string the old ip address
# @param newip string the new ip address
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
	die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_change_license_ip, message: {})
print response.body[:api_change_license_ip_response][:return],"\n"