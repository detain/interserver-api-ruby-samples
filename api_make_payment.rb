#!/usr/bin/env ruby
#
# api_make_payment
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Makes a payment for an invoice on a module.
#
# @param sid string the *Session ID* you get from the [login](#login) call
# @param module string the module of the service being paid on
# @param invoice int the invoice id you want to make a payment on
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
	:api_make_payment, message: { 
		sid: ARGV[0], 
		module: ARGV[1], 
		invoice: ARGV[2], 
})
print response.body[:api_make_payment_response][:return],"\n"
