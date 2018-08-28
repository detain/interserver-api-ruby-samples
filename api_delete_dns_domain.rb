#!/usr/bin/env ruby
#
# api_delete_dns_domain
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Deletes a Domain from our DNS servers
#
# @param sid string the *Session ID* you get from the [login](#login) call
# @param domain_id int The ID of the domain in question.
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
	:api_delete_dns_domain, message: { 
		sid: ARGV[0], 
		domain_id: ARGV[1], 
})
print response.body[:api_delete_dns_domain_response][:return],"\n"
