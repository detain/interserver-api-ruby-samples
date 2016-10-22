#!/usr/bin/env ruby
#
# get_locked_ips
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This will return a list of all IP addresses used for fraud.   Its probably of no
# real use to anyone, butI use it to block IP addresses and similar things. 
#
#
require 'savon'

client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')
response = client.call(:get_locked_ips)
print response.body[:get_locked_ips_response][:return],"\n"
