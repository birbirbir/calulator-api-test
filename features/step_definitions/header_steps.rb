Then(/^the response has the header "(.*?)" with the value "(.*?)"$/) do |header, value|
  @headers = @response.headers
  expect(@headers.keys).to include(header.to_sym), "Could not find header : #{header} in the response"
  expect(@headers.values).to include(value), "Could not find header value : #{value} in the response"
  @logger.info "Successfully Verified response Header value"
  @logger.info "==========================Test Case Execution End=========================="
end

