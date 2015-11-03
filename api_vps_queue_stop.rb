#!/usr/bin/env ruby
#
# api_vps_queue_stop
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# stops a vps
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param id int defaults to false, if specifeid tries usign that di instead of the one passed
#
require 'savon'

client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')

response = client.call(:api_login, message: {username: ARGV[0],password: ARGV[1]})
sid = response.body[:api_login_response][:return]
if (sid == "")
  die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(:api_vps_queue_stop, message: 

{

                                             sid: ARGV[0], 
                                             id: ARGV[1], 

}

)
print response.body[:api_vps_queue_stop_response][:return],"\n"