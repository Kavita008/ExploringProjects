Feature: Verify login page for "username"


  Scenario:Verify login page for username

    Given the user navigate to home page
    When the user enters "standard_user" in username field
    And the user enters "secret_sauce" in password field
    And the user clicks on the login button
    Then the user should see "Products" text on the page

  Scenario: Verify the login page with with no username and no password

    Given the user navigate to home page
    When the user enters "" in username field
    And the user enters "" in password field
    And the user clicks on the login button
    Then the user should see "Epic sadface: Username is required" text on the page


  Scenario Outline: Verify login page with invalid credentials
    Given the user navigate to home page
    When the user enters "<username>" in username field
    And the user enters "<password>" in password field
    And the user clicks on the login button
    And the user should see "<expectedtext>" text on the page

    Examples:
      | username      | password    |expectedtext|
      |standard-use  | secret_sauce| Epic sadface: Username and password do not match any user in this service|
      |standard_user | Secret-sauce|Epic sadface: Username and password do not match any user in this service|




    Scenario: Verify login page with valid credentials
      Given the user navigate to home page
      When the user enters "locked_out_user" in username field
      And the user enters "secret_sauce" in password field
      And the user clicks on the login button
      Then the user should see "Epic sadface: Sorry, this user has been locked out." text on the page
      

      Scenario: : Verify login page with invalid credentials
        Given the user navigate to home page
        When the user enters "" in username field
        And the user enters "secret_sauce" in password field
        And the user clicks on the login button
        Then the user should see "Epic sadface: Username is required" text on the page





Scenario Outline: Verify login page with invalid credentials
  Given the user navigate to home page
  When the user enters "<username>" in username field
  And the user enters "<password>" in password field
  And the user clicks on the login button
 Then the user should see "<expectedtext>" text on the page


  Examples:

 | username        | password                       |  expectedtext|
 | Locked-out-user |  secret_sauce                  |Epic sadface: Username and password do not match any user in this service      |
 |                 |     secret_sauce               |Epic sadface: Username is required                                      |


