Feature: Deleting tickets
  In order to delete tickets
  As a user
  I want a way to delete tickets

  Background:
    Given there is a project called "TextMate 2"
    And there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And "user@ticketee.com" has created a ticket for this project:
      | title           | description |
      | Make it shiny!  | Gradients! Starbursts! Oh my! |
    Given I am on the homepage
    When I follow "TextMate 2"
    And I follow "Make it shiny!"

  Scenario: Deleting a ticket
    When I follow "Delete Ticket"
    Then I should see "You need to sign in or sign up before continuing"
    And I am signed in as them
    When I follow "TextMate 2"
    And I follow "Make it shiny!"
    And I follow "Delete Ticket"
    Then I should see "Ticket has been deleted."
    And I should not see "Make it shiny!"