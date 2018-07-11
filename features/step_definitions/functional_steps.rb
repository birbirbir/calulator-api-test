require_relative '../../lib/calculator'
require 'rest-client'

Given(/^I have entered "(.*?)" into the calculator$/) do |number|
  @calculator ||= Calculator.new
  @calculator.push(number)
end

When(/^I press "(.*?)"$/) do |operation|
  firstVariable = @calculator.getFirstNumber
  secondVariable = @calculator.getSecondNumber
  @operation = operation
  if @operation.eql?('sqrt')
    url = "http://localhost:8080/math/#{operation}?a=#{firstVariable}"
  else
    url = "http://localhost:8080/math/#{operation}?a=#{firstVariable}&b=#{secondVariable}"
  end
  # Don't raise exceptions but return the response
  @response = RestClient.get(url){|response, request, result| response }
end

Then(/^the JSON response should have value "(.*?)"$/) do |output|
  @data = JSON.parse(@response)
  if (@operation.eql?('add') || @operation.eql?('minus') || @operation.eql?('multiply'))
    expect(@data).to be == output.to_i
  elsif (@operation.eql?('divide') || @operation.eql?('sqrt'))
    expect(@data).to be == output.to_f
  end
end

Then(/^the request (?:is|was) successful$/) do
  raise %/Expected Successful response code 2xx but was #{@response.code}/ if @response.code < 200 || @response.code >= 300
end