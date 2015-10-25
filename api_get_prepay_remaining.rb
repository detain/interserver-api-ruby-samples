#!/usr/bin/env ruby
#
# api_get_prepay_remaining
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Get the PrePay amount available for a given module.
#
# @param module string the module you want to check your prepay amounts on
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')

response = client.call(:api_get_prepay_remaining, message: {})
print response.body[:api_get_prepay_remaining_response][:return],"\n"