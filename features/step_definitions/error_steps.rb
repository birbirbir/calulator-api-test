
Then(/^the response has "(.*?)" and "(.*?)"$/) do |statusCode, errorValue|
  raise %/Expect Status code : #{statusCode} but was #{statusCode}/ if statusCode != statusCode.to_i
  raise %/Expect Status code : #{errorValue} but was #{value}/ if value != errorValue.to_s
end