#!/usr/bin/env ruby
#
# api_login
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This function creates a session in our system which you will need to pass to
# most functions for authentication.
#
# @param username string the username (email address) you signed up with.
# @param password string the password you use to login to the web account, or alternatively the API key.
#
require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')

response = client.call(:api_login, message: {})
print response.body[:api_login_response][:return],"\n"