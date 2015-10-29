#!/usr/bin/env ruby
#
# api_get_paypal_url
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Get the PayPal payment URL for an invoice on a given module.
#
# @param module string 
# @param invoice int 
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')

response = client.call(:api_get_paypal_url, message: {})
print response.body[:api_get_paypal_url_response][:return],"\n"