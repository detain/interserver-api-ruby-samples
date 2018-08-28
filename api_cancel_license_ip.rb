#!/usr/bin/env ruby
#
# api_cancel_license_ip
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Cancel a License by IP and Type.
#
# @param sid string the *Session ID* you get from the [login](#login) call
# @param ip string IP Address to cancel
# @param type int Package ID. use [get_license_types](#get-license-types) to get a list of possible types.
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
	:api_cancel_license_ip, message: { 
		sid: ARGV[0], 
		ip: ARGV[1], 
		type: ARGV[2], 
})
print response.body[:api_cancel_license_ip_response][:return],"\n"
