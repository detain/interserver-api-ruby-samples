#!/usr/bin/env ruby
#
# api_add_dns_domain
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Adds a new domain into our system.  The status will be "ok" if it added, or
# "error" if there was any problems status_text will contain a description of the
# problem if any.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param domain string domain name to host
# @param ip string ip address to assign it to.
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
	die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_add_dns_domain, message: {})
print response.body[:api_add_dns_domain_response][:return],"\n"