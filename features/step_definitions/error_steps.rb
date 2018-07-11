
Then(/^the response has "(.*?)" and "(.*?)"$/) do |statusCode, errorValue|
  @data = JSON.parse(@response)
  raise %/Expect Status code : #{statusCode} but was #{@data["status"]}/ if @data["status"] != statusCode.to_i
  raise %/Expect Error : #{errorValue} but was #{@data["error"]}/ if @data["error"] != errorValue.to_s
end