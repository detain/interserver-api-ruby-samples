#!/usr/bin/env ruby
#
# api_vps_screenshot
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This command returns a link to an animated screenshot of your VPS.   Only works
# currently with KVM VPS servers
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param id int false to link to the image itself , otherwise a url
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')


response = client.call(:api_login, message: {username: argv[1],password: argv[2]})
sid = response.body[:api_login_response][:return]
if (sid == "")
	die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_vps_screenshot, message: {})
print response.body[:api_vps_screenshot_response][:return],"\n"