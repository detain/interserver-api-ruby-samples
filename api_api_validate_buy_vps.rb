#!/usr/bin/env ruby
#
# api_api_validate_buy_vps
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Checks if the parameters for your order pass validation and let you know if
# there are any errors. It will also give you information on the pricing
# breakdown.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param os string 
# @param slices int 
# @param platform string 
# @param controlpanel string 
# @param period int 
# @param location int 
# @param version string 
# @param hostname string 
# @param coupon string 
# @param rootpass string 
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
	die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_api_validate_buy_vps, message: {})
print response.body[:api_api_validate_buy_vps_response][:return],"\n"