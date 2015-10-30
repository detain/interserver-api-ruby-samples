#!/usr/bin/env ruby
#
# api_get_prepay_paypal_fill_url
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Gets a PayPal URL to fill a PrePay.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param module string the module the prepay is for. use [get_modules](#get_modules) to get a list of modules
# @param prepay_id int the ID of the PrePay
# @param amount float the amount to pay on the prepay.
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
	die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_get_prepay_paypal_fill_url, message: {})
print response.body[:api_get_prepay_paypal_fill_url_response][:return],"\n"