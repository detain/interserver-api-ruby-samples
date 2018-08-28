#!/usr/bin/env ruby
#
# api_api_buy_vps
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Places a VPS order in our system. These are the same parameters as
# api_validate_buy_vps..   Returns a comma seperated list of invoices if any need
# paid.
#
# @param sid string the *Session ID* you get from the [login](#login) call
# @param os string file field from [get_vps_templates](#get_vps_templates)
# @param slices int 1 to 16 specifying the scale of the VPS resources you want (a 3 slice has 3x the resources of a 1 slice vps)
# @param platform string platform field from the [get_vps_platforms_array](#get_vps_platforms_array)
# @param controlpanel string none, cpanel, or da for None, cPanel, or DirectAdmin control panel addons, only available with CentOS
# @param period int 1-36, How frequently to be billed in months. Some discounts as given based on the period
# @param location int id field from the [get_vps_locations_array](#get_vps_locations_array)
# @param version string os field from [get_vps_templates](#get_vps_templates)
# @param hostname string Desired Hostname for the VPS
# @param coupon string Optional Coupon to pass
# @param rootpass string Desired Root Password (unused for windows, send a blank string)
#
require 'savon'

client = Savon.client(wsdl: 'https://my.interserver.net/api.php?wsdl')
response = client.call(
	:api_login, message: {
		username: ARGV[0],
		password: ARGV[1]
})
sid = response.body[:api_login_response][:return]
if (sid == "")
	die("Got a blank session id");
print "got session id ",sid,"\n"
response = client.call(
	:api_api_buy_vps, message: { 
		sid: ARGV[0], 
		os: ARGV[1], 
		slices: ARGV[2], 
		platform: ARGV[3], 
		controlpanel: ARGV[4], 
		period: ARGV[5], 
		location: ARGV[6], 
		version: ARGV[7], 
		hostname: ARGV[8], 
		coupon: ARGV[9], 
		rootpass: ARGV[10], 
})
print response.body[:api_api_buy_vps_response][:return],"\n"
