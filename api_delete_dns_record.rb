#!/usr/bin/env ruby
#
# api_delete_dns_record
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Deletes a single DNS record
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param domain_id int The ID of the domain in question.
# @param record_id int The ID of the domains record to remove.
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
	die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_delete_dns_record, message: {})
print response.body[:api_delete_dns_record_response][:return],"\n"