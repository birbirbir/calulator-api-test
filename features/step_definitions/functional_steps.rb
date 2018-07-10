require_relative '../../lib/calculator'
require 'rest-client'

Given(/^I have entered "([^"]*)" into the calculator$/) do |number|
  @calculator ||= Calculator.new
  @calculator.push(number.to_i)
end

When(/^I press "(.*?)"$/) do |operation|
  firstVariable = @calculator.getFirstNumber
  secondVariable = @calculator.getSecondNumber
  url = "http://localhost:8080/math/#{operation}?a=#{firstVariable}&b=#{secondVariable}"
  @response = RestClient.get url
end

Then(/^the request (?:is|was) successful$/) do
  raise %/Expected Successful response code 2xx but was #{@response.code}/ if @response.code < 200 || @response.code >= 300
end

Then(/^the JSON response should have value '(\d+)'$/) do |output|
  @data = JSON.parse(@response)
  expect(@data).to be == output.to_i
end