#!/usr/bin/env ruby
#
# api_vps_get_server_name
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Get the name of the vps master/host server your giving the id for
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param id int id of the vps master
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
	die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_vps_get_server_name, message: {})
print response.body[:api_vps_get_server_name_response][:return],"\n"