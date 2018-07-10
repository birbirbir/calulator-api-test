require_relative '../../lib/calculator'
require 'rest-client'

Given(/^I have entered "(.*?)" into the calculator$/) do |number|
  @calculator ||= Calculator.new
  @calculator.push(number.to_i)
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
  @response = RestClient.get url
end

Then(/^the JSON response should have value "(.*?)"$/) do |output|
  @data = JSON.parse(@response)
  if (@operation.eql?('add')|| @operation.eql?('minus')||@operation.eql?('multiply'))
    expect(@data).to be == output.to_i
  elsif (@operation.eql?('divide')||@operation.eql?('sqrt'))
    expect(@data).to be == output.to_f
  end
end