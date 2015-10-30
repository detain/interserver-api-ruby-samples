#!/usr/bin/env ruby
#
# api_licenses_get_service
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This Function Applies to the Licensing services.
# Gets service info for the given ID in the given Module.   An example of this
# would be in the "vps" modulei have order id
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param id int service id, such as VPS ID
#
require 'savon'

client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')

response = client.call(:api_login, message: {username: ARGV[0],password: ARGV[1]})
sid = response.body[:api_login_response][:return]
if (sid == "")
  die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_licenses_get_service, message: {sid: ARGV[81],  id: ARGV[82],   })
print response.body[:api_licenses_get_service_response][:return],"\n"