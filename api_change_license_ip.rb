#!/usr/bin/env ruby
#
# api_change_license_ip
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Change the IP on an active license.
#
# @param sid string the *Session ID* you get from the [login](#login) call
# @param oldip string the old ip address
# @param newip string the new ip address
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
	:api_change_license_ip, message: { 
		sid: ARGV[0], 
		oldip: ARGV[1], 
		newip: ARGV[2], 
})
print response.body[:api_change_license_ip_response][:return],"\n"
