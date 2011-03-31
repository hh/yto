Given /^I have no trainings$/ do
  Training.delete_all
end

Given /^I (only )?have trainings titled "?([^\"]*)"?$/ do |only, titles|
  Training.delete_all if only
  titles.split(', ').each do |title|
    Training.create(:focus => title)
  end
end

Then /^I should have ([0-9]+) trainings?$/ do |count|
  Training.count.should == count.to_i
end
