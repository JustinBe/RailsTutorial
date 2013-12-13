Feature: Editing tickets
  In order to alter ticket information
  As a user
  I want a form to edit the tickets

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And there is a project called "TextMate 2"
    And "user@ticketee.com" has created a ticket for this project:
      | title           | description |
      | Make it shiny!  | Gradients! Starbursts! Oh my! |
    Given I am on the homepage
    When I follow "TextMate 2"
    And I follow "Make it shiny!"
    And I follow "Edit Ticket"
    Then I should see "You need to sign in or sign up before continuing"
    When I fill in "Email" with "user@ticketee.com"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Edit Ticket"

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