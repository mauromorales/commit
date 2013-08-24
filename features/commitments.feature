Feature: Handle commitments

  Scenario: Show help menu with no options or arguments
     When I run `commit`
     Then the stdout should contain "help"

  Scenario: Show help menu when called
     When I successfully run `commit help`
     Then the stdout should contain "help"

  Scenario: Empty commitments list
    Given there are no commitments
     When I run `commit list`
     Then the stdout should contain "You haven't commited to anything yet. Start a new commitment by running 'commit start'"

  Scenario: Create a new commitment
     When I run `commit start` interactively
      And I type "compartmentalize"
      And I close the stdin stream
     Then the stdout should contain "Great! You have commited to compartmentalize daily"
      And a directory named "compartmentalize" should exist

  Scenario: List all commitments
     When I run `commit list`
     Then the stdout should contain "You have commited to do the following:"

  Scenario: Display a commitment info
     When I run `commit show compartmentalize`
     Then the stdout should contain "You started to compartmentalize since"

  Scenario: Check in on a commitment
     When I run `commit checkin compartmentalize`
     Then the stdout should contain "Awesome you did it!"
