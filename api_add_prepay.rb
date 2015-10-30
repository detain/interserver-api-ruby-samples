#!/usr/bin/env ruby
#
# api_add_prepay
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Adds a PrePay into the system under the given module.    PrePays are a credit on
# your account by prefilling  your account with funds.   These are stored in a
# PrePay.    PrePay funds can be automaticaly used as needed or set to only be
# usable by direct action
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param module string the module the prepay is for. use [get_modules](#get_modules) to get a list of modules
# @param amount float the dollar amount of prepay total
# @param automatic_use bool wether or not the prepay will get used automatically by billing system.
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
  die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_add_prepay, message: {})
print response.body[:api_add_prepay_response][:return],"\n"