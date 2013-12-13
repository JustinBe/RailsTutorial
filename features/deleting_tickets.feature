Feature: Deleting tickets
  In order to delete tickets
  As a user
  I want a way to delete tickets

  Background:
    Given there is a project called "TextMate 2"
    And that project has a ticket:
    | title | description |
    | Make it shiny! | Gradients! Starbursts! Oh my! |
    Given I am on the homepage
    When I follow "TextMate 2"
    And I follow "Make it shiny!"

  Scenario: Deleting a ticket
    When I follow "Delete Ticket"
    Then I should see "Ticket has been deleted."
    And I should not see "Make it shiny!"