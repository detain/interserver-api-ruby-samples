#!/usr/bin/env ruby
#
# api_delete_dns_record
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Deletes a single DNS record
#
# @param sid string the *Session ID* you get from the [login](#login) call
# @param domain_id int The ID of the domain in question.
# @param record_id int The ID of the domains record to remove.
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
	:api_delete_dns_record, message: { 
		sid: ARGV[0], 
		domain_id: ARGV[1], 
		record_id: ARGV[2], 
})
print response.body[:api_delete_dns_record_response][:return],"\n"
