require_relative '../../lib/calculator'
require 'rest-client'

Given(/^I have entered "([^"]*)" into the calculator$/) do |number|
  @calculator ||= Calculator.new
  @calculator.push(number.to_i)
end

When(/^I press add$/) do
  firstVariable = @calculator.getFirstNumber
  secondVariable = @calculator.getSecondNumber
  url = "http://localhost:8080/math/add?a=7&b=7"
end

Then(/^the request (?:is|was) successful$/) do
  raise %/Expected Successful response code 2xx but was #{@response.code}/ if @response.code < 200 || @response.code >= 300
end


When /^I send a (GET|PUT|POST|DELETE) request (?:for|to) "([^"]*)"(?: with the following:)?$/ do |*args|
  request_type = args.shift.downcase
  url = args.shift
  payload = args.shift

  if (payload.nil? && request_type == 'get')
    @response = RestClient.get url
  elsif (payload.nil? && request_type == 'delete')
    @response = RestClient.delete url
  elsif (payload && request_type == 'get')
    @response = RestClient.get url, payload
  elsif (payload && request_type == 'post')
    @response = RestClient.post url, payload
  elsif (payload && request_type == 'put')
    @response = RestClient.post url, payload
  end
end