#!/usr/bin/env ruby
#
# api_get_ima
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Returns the IMA value.  This function tells you that I'm a client, or I'm a
# admin. This is almost always going to return client, Adminsitrators will get an
# admin response.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
  die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_get_ima, message: {})
print response.body[:api_get_ima_response][:return],"\n"