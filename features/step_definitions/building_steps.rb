Given /^I have buildings titled (.+) with short_names (.+)$/ do |titles, short_names|
  sn = short_names.split(', ')
  titles.split(', ').each_with_index do |title, i|
    Building.create!(:name => title, :suburb => "Sydney", :state => "NSW", :short_name => sn[i])
  end
end

Given /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |username, password|
  visit login_url
  fill_in "Username", :with => username
  fill_in "Password", :with => password
  click_button "Submit"
end

