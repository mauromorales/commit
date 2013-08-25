Feature: Handle commitments

  Scenario: Show help menu with no options or arguments
     When I run `commit`
     Then the stdout should contain "help"

  Scenario: Show help menu when called
     When I successfully run `commit help`
     Then the stdout should contain "help"

  Scenario: Empty commitments list
    Given there are no commitments
     When I run `commit list --path=test`
     Then the stdout should contain "You haven't commited to anything yet. Start a new commitment by running 'commit start'"

  Scenario: Create a new commitment
     When I run `commit start --path=test` interactively
      And I type "compartmentalize"
      And I close the stdin stream
     Then the stdout should contain "Great! You have commited to compartmentalize daily"
      And a directory named "test/compartmentalize" should exist

  Scenario: List all commitments
    Given a commitment named "compartmentalize" exists
     When I run `commit list --path=test`
     Then the stdout should contain "You have commited to do the following:"

  Scenario: Display a commitment info
    Given a commitment named "compartmentalize" exists
     When I run `commit show compartmentalize --path=test`
     Then the stdout should contain "You started to compartmentalize since"

  Scenario: Check in on a new commitment
    Given a commitment named "compartmentalize" exists
      And "compartmentalize" was started today
     When I run `commit checkin compartmentalize --path=test`
     Then the stdout should contain "Awesome your first commit"

  Scenario: Check in on an missed commitment
    Given a commitment named "compartmentalize" exists
      And "compartmentalize" last checkin was 2 days ago
     When I run `commit checkin compartmentalize --path=test`
     Then the stdout should contain "Glad to see you back"

@wip
  Scenario: Check in on time
    Given a commitment named "compartmentalize" exists
      And "compartmentalize" last checkin was 1 days ago
     When I run `commit checkin compartmentalize --path=test`
     Then the stdout should contain "Awesome you did it"
