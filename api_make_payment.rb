#!/usr/bin/env ruby
#
# api_make_payment
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Makes a payment for an invoice on a module.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param module string the module of the service being paid on
# @param invoice int the invoice id you want to make a payment on
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
	die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_make_payment, message: {})
print response.body[:api_make_payment_response][:return],"\n"