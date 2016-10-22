#!/usr/bin/env ruby
#
# get_vps_templates
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Get the currently available VPS templates for each server type.
#
#
require 'savon'

client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')
response = client.call(:get_vps_templates)
print response.body[:get_vps_templates_response][:return],"\n"
