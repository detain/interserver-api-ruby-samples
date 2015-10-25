#!/usr/bin/env ruby
#
# get_hostname
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Resolves an IP Address and returns the hostname it points to.
#
# @param ip string IP Address
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')

response = client.call(:get_hostname, message: {})
print response.body[:get_hostname_response][:return],"\n"