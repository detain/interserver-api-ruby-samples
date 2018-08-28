#!/usr/bin/env ruby
#
# api_api_auto_cpanel_login
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Logs into cpanel for the given website id and returns a unique logged-in url. 
# The status will be "ok" if successful, or "error" if there was any problems
# status_text will contain a description of the problem if any.
#
# @param sid string the *Session ID* you get from the [login](#login) call
# @param id int id of website
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
	:api_api_auto_cpanel_login, message: { 
		sid: ARGV[0], 
		id: ARGV[1], 
})
print response.body[:api_api_auto_cpanel_login_response][:return],"\n"
