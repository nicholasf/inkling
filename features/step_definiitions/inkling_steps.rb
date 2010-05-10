#Thens ...
Then /^show source$/ do
  puts response.body
end

Then /^response code should be "(.*)"$/ do |code|
  response.code.should == code
end
