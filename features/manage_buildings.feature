Feature: Manage Buildings
	In order to document the building portfolio
	As a property data manager
	I want to create and manage buildings
	
	Scenario: Buildings List
		Given I have buildings titled 275 Kent Street, 60 Martin Place with short_names 275K, 60MP
		When I go to the list of buildings
		Then I should see "275 Kent Street"
		And I should see "275K"
		And I should see "60 Martin Place"
		And I should see "60MP"
	
	Scenario: Edit Building
		Given I am logged in as "geth" with password "nippon"
		And I have buildings titled 275 Kent Street with short_names 275K
		When I go to the building page for "275 Kent Street"
		Then I should see "275 Kent Street"