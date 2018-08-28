#!/usr/bin/env ruby
#
# api_add_dns_domain
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Adds a new domain into our system.  The status will be "ok" if it added, or
# "error" if there was any problems status_text will contain a description of the
# problem if any.
#
# @param sid string the *Session ID* you get from the [login](#login) call
# @param domain string domain name to host
# @param ip string ip address to assign it to.
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
	:api_add_dns_domain, message: { 
		sid: ARGV[0], 
		domain: ARGV[1], 
		ip: ARGV[2], 
})
print response.body[:api_add_dns_domain_response][:return],"\n"
