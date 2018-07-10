Feature: Test caluculator operations

  Scenario Outline: As a user, I want to operate numbers together
    Given I have entered "<firstValue>" into the calculator
    And I have entered "<secondValue>" into the calculator
    When I press "<operation>"
    Then the request is successful
    Then the JSON response should have value "<output>"
    Examples:
      | firstValue | secondValue | operation | output |
      | 2          | 5           | add       | 7      |
      | 2          | 5           | divide    | 0.4    |
      | 2          | 5           | minus     | -3     |

  Scenario Outline: As a user, I want to put one number to the power of itself
    Given I have entered "<firstValue>" into the calculator
    When I press "sqrt"
    Then the request is successful
    Then the JSON response should have value "<output>"
    Examples:
      | firstValue | output |
      | 8          | 64     |