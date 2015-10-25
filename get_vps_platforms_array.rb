#!/usr/bin/env ruby
#
# get_vps_platforms_array
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Use this function to get a list of the various platforms available for ordering.
# The platform field in the return value is also needed to pass to the buy_vps
# functions.
#
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')

response = client.call(:get_vps_platforms_array, message: {})
print response.body[:get_vps_platforms_array_response][:return],"\n"