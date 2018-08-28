#!/usr/bin/env ruby
#
# api_get_prepay_remaining
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Get the PrePay amount available for a given module.
#
# @param sid string the *Session ID* you get from the [login](#login) call
# @param module string the module you want to check your prepay amounts on
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
	:api_get_prepay_remaining, message: { 
		sid: ARGV[0], 
		module: ARGV[1], 
})
print response.body[:api_get_prepay_remaining_response][:return],"\n"
