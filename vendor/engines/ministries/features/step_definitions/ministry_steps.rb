Given /^I have no ministries$/ do
  Ministry.delete_all
end

Given /^I (only )?have ministries titled "?([^\"]*)"?$/ do |only, titles|
  Ministry.delete_all if only
  titles.split(', ').each do |title|
    Ministry.create(:title => title)
  end
end

Then /^I should have ([0-9]+) ministr[y|ies]+?$/ do |count|
  Ministry.count.should == count.to_i
end
