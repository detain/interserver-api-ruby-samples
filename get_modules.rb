#!/usr/bin/env ruby
#
# get_modules
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Returns a list of all the modules available.
#
#
require 'savon'

client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')
response = client.call(:get_modules)
print response.body[:get_modules_response][:return],"\n"
