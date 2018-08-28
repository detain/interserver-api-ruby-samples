#!/usr/bin/env ruby
#
# api_get_paypal_url
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Get the PayPal payment URL for an invoice on a given module.
#
# @param module string the module the invoice is for. use [get_modules](#get_modules) to get a list of modules
# @param invoice int the invoice id, or a comma separated list of invoice ids to get a payment url for.
#
require 'savon'

client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')
response = client.call(
	:api_get_paypal_url, message: { 
		module: ARGV[0], 
		invoice: ARGV[1], 
})
print response.body[:api_get_paypal_url_response][:return],"\n"
