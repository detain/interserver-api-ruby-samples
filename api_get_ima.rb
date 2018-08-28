#!/usr/bin/env ruby
#
# api_get_ima
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Returns the IMA value.  This function tells you that I'm a client, or I'm a
# admin. This is almost always going to return client, Adminsitrators will get an
# admin response.
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
	:api_get_ima, message: { 
		sid: ARGV[0], 
})
print response.body[:api_get_ima_response][:return],"\n"
