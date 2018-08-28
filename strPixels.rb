#!/usr/bin/env ruby
#
# strPixels
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This function uses the array below to calculate the pixel width of a string of
# characters. The widths of each character are based on a 12px Helvetica font. 
# Kerning is not taken into account so RESULTS ARE APPROXIMATE.  The purpose is to
# return a relative size to help in formatting. For example, strPixels('I like
# cake') == 54    strPixels('I LIKE CAKE') == 67
#
# @param string string characters to measure size
#
require 'savon'

client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')
response = client.call(
	:strPixels, message: { 
		string: ARGV[0], 
})
print response.body[:strPixels_response][:return],"\n"
