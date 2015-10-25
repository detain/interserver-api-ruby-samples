#!/usr/bin/env ruby
#
# api_change_license_ip_by_id
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Change the IP on an active license.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param id int the license order id of the license to change the ip for
# @param newip string the new ip address to associate with the license
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
	die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_change_license_ip_by_id, message: {})
print response.body[:api_change_license_ip_by_id_response][:return],"\n"