Feature: Editing tickets
  In order to alter ticket information
  As a user
  I want a form to edit the tickets

  Background:
    Given there is a project called "TextMate 2"
    And that project has a ticket:
      | title           | description |
      | Make it shiny!  | Gradients! Starbursts! Oh my! |
    Given I am on the homepage
    When I follow "TextMate 2"
    And I follow "Make it shiny!"
    And I follow "Edit Ticket"

  Scenario: Updating a ticket
    When I fill in "Title" with "Make it dull"
    And I fill in "Description" with "Rust, Magnesium... boring."
    And I press "Update Ticket"
    And I should see "Make it dull" within "#ticket h2"
    But I should not see "Make it shiny!"

  Scenario: Updating a ticket with invalid information
    When I fill in "Title" with ""
    And I press "Update Ticket"
    Then I should see "Ticket has not been updated."