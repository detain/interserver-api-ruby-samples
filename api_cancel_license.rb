#!/usr/bin/env ruby
#
# api_cancel_license
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Cancel a License.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param id int License Order ID
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
	die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_cancel_license, message: {})
print response.body[:api_cancel_license_response][:return],"\n"