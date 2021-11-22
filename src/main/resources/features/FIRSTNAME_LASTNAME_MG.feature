Feature: Login Application

  @SmokeTest
  Scenario: Create a new account with valid password
    Given I am on MoneyGaming home page
    When  I try sign up for new account
    And I fill up sing up information
      | title               | Mr                       |
      | First Name          | John                     |
      | Surname             | Walker                   |
      | DOB Day             | 10                       |
      | DOB Month           | June                     |
      | DOB Year            | 1978                     |
      | Email               | 0123johnwalker@gmail.com |
      | Phone               | 305-300-0000             |
      | Mobile              | 305-300-0000             |
      | Address Line 1      | 1234 Washington St       |
      | City                | Miami                    |
      | County              | Dade                     |
      | Postcode            | 33140                    |
      | Country             | ALBANIA                  |
      | User Name           | John123                  |
      | Password            | 1#JohnWalker             |
      | Security q1: Answer | Superman                 |
      | Security q2: Answer | Chicago                  |
      | Currency            | US Dollars               |


    Then When I enter <Password> it must be at least 6 characters long with at least one number and at least one special character
    And I check the tickbox with text 'I accept the Terms and Conditions and certify that I am over the age of 18
    And I submit the form by clicking the JOIN NOW button
    Then I should see the <Welcome> message


  Scenario Outline: Verify that User cannot create an account with password and invalid
    Given I am on MoneyGaming home page
    When  I try sign up with invalid "<username>" or "<password>"
    Then  I should get error message

    Examples:
      | username | password    |
      | John123  | 1#Jo        |
      | JO23     | 1#Jon       |
      | #John123 | 123456      |
      | John123  | 1JohnWalker |



