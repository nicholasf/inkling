Given /^(?:|I )visit (.+)$/ do |path|
  puts "****#{path} ****"
  debugger
  visit path
end


#Thens ...
Then /^show source$/ do
  puts response.body
end


#Then /^response code should be "(.*)"$/ do |code|
#Then /^I should see response code "([^\"]*)" $/ do |code|
#  response.code.should == code
#end

Then /^I should see response code "([^\"]*)"$/ do |arg1|
#  debugger
  response.code.should == arg1
end

Then /^I should not see link "([^\"]*)" to "([^\"]*)"$/ do |arg1, arg2|
  doc = Nokogiri::HTML(response.body)
  nodeset = doc.xpath("//a[@href='#{arg2}']")
  if nodeset and nodeset.size != 0
    fail("Found matching link for #{arg2}")
  end
end

Then /^I should see link "([^\"]*)" to "([^\"]*)"$/ do |arg1, arg2|
  doc = Nokogiri::HTML(response.body)
  nodeset = doc.xpath("//a[@href='#{arg2}']")
  if nodeset and nodeset.size == 0
    fail("No matching links for #{arg2}")
  end
end
