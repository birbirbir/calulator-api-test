require_relative '../../lib/calculator'
require 'rest-client'
require 'logger'

Given(/^I have entered "(.*?)" into the calculator$/) do |number|
  @logger = Logger.new STDOUT
  @calculator ||= Calculator.new
  @calculator.push(number)
end

When /^I send a (GET|DELETE) request (?:for|to) "([^"]*)"$/ do |*args|
  @logger = Logger.new STDOUT
  request_type = args.shift.downcase
  url = args.shift

  if (request_type == 'get')
    @response = RestClient.get(url){|response, request, result| response }
  elsif (request_type == 'delete')
    @response = RestClient.delete(url){|response, request, result| response }
  end
  @logger.info ">> Request URL: #{url}"
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
  #@response = RestClient.get(url){|response, request, result| response }
  step "I send a GET request for \"#{url}\""
  @logger.info "Select #{operation} operation"
end

Then(/^the JSON response should have value "(.*?)"$/) do |output|
  @data = JSON.parse(@response)
  @logger.info "Returned JSON value is : #{@data}"
  if (@operation.eql?('add') || @operation.eql?('minus') || @operation.eql?('multiply'))
    raise %/Expect Result is : #{output} but was return #{@data}/ if @data != output.to_i
  elsif (@operation.eql?('divide') || @operation.eql?('sqrt'))
    if @data.eql?("NaN")
      raise %/Expect Result is : #{output} but was return #{@data}/ if @data != output.to_s
    else
      raise %/Expect Result is : #{output} but was return #{@data}/ if @data != output.to_f
    end
  end
  @logger.info "Successfully Verified response value"
  @logger.info "==========================Test Case Execution End=========================="
end

Then(/^the request (?:is|was) successful$/) do
  raise %/Expected Successful response code 2xx but was #{@response.code}/ if @response.code < 200 || @response.code >= 300
  @logger.info ">> Retrun response http code: #{@response.code}"
end