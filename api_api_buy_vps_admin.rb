#!/usr/bin/env ruby
#
# api_api_buy_vps_admin
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Purchase a VPS (admins only).   Returns a comma seperated list of invoices if
# any need paid.  Same as client function but allows specifying which server to
# install to if there are resources available on the specified server.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param os string 
# @param slices int 
# @param platform string 
# @param controlpanel string 
# @param period int 
# @param location int 
# @param version int 
# @param hostname string 
# @param coupon string 
# @param rootpass string 
# @param server int 
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
	die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_api_buy_vps_admin, message: {})
print response.body[:api_api_buy_vps_admin_response][:return],"\n"