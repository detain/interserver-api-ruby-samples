#!/usr/bin/env ruby
#
# api_get_license_types
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Get a license of the various license types.
#
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')

response = client.call(:api_get_license_types, message: {})
print response.body[:api_get_license_types_response][:return],"\n"