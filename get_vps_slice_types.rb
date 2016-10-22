#!/usr/bin/env ruby
#
# get_vps_slice_types
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# We have several types of Servers available for use with VPS Hosting. You can get
# a list of the types available and  there cost per slice/unit by making a call to
# this function
#
#
require 'savon'

client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')
response = client.call(:get_vps_slice_types)
print response.body[:get_vps_slice_types_response][:return],"\n"
