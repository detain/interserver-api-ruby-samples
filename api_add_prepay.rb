#!/usr/bin/env ruby
#
# api_add_prepay
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Adds a PrePay into the system under the given module.    PrePays are a credit on
# your account by prefilling  your account with funds.   These are stored in a
# PrePay.    PrePay funds can be automatically used as needed or set to only be
# usable by direct action
#
# @param sid string the *Session ID* you get from the [login](#login) call
# @param module string the module the prepay is for. use [get_modules](#get_modules) to get a list of modules
# @param amount float the dollar amount of prepay total
# @param automatic_use bool whether or not the prepay will get used automatically by billing system.
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
	:api_add_prepay, message: { 
		sid: ARGV[0], 
		module: ARGV[1], 
		amount: ARGV[2], 
		automatic_use: ARGV[3], 
})
print response.body[:api_add_prepay_response][:return],"\n"
