#!/usr/bin/env ruby
#
# api_buy_license
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Purchase a License.  Returns an invoice ID.
#
# @param sid string the *Session ID* you get from the [login](#login) call
# @param ip string ip address you wish to license some software on
# @param type int the package id of the license type you want. use [get_license_types](#get-license-types) to get a list of possible types.
# @param coupon string an optional coupon
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
	:api_buy_license, message: { 
		sid: ARGV[0], 
		ip: ARGV[1], 
		type: ARGV[2], 
		coupon: ARGV[3], 
})
print response.body[:api_buy_license_response][:return],"\n"
