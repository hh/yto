Given /^I have no communications$/ do
  Communication.delete_all
end

Given /^I (only )?have communications titled "?([^\"]*)"?$/ do |only, titles|
  Communication.delete_all if only
  titles.split(', ').each do |title|
    Communication.create(:title => title)
  end
end

Then /^I should have ([0-9]+) communications?$/ do |count|
  Communication.count.should == count.to_i
end
