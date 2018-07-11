Feature: Test caluculator operations

  @functions
  Scenario Outline: As a user, I want to add numbers together
    Given I have entered "<firstValue>" into the calculator
    And I have entered "<secondValue>" into the calculator
    When I press "add"
    Then the request is successful
    Then the JSON response should have value "<output>"
    Examples:
      | firstValue | secondValue | output |
      | 2          | 5           | 7      |
      | 3          | 5           | 8    |
      | 2          | 10           | 12      |

  @functions
  Scenario Outline: As a user, I want to subtract numbers together
    Given I have entered "<firstValue>" into the calculator
    And I have entered "<secondValue>" into the calculator
    When I press "minus"
    Then the request is successful
    Then the JSON response should have value "<output>"
    Examples:
      | firstValue | secondValue | output |
      | 2          | 5           | 7      |
      | 2          | 5           | 0.4    |
      | 2          | 5           | -3     |

  @functions
  Scenario Outline: As a user, I want to multiply numbers together
    Given I have entered "<firstValue>" into the calculator
    And I have entered "<secondValue>" into the calculator
    When I press "multiply"
    Then the request is successful
    Then the JSON response should have value "<output>"
    Examples:
      | firstValue | secondValue | output |
      | 2          | 5           | 7      |
      | 2          | 5           | 0.4    |
      | 2          | 5           | -3     |

  @functions
  Scenario Outline: As a user, I want to divide numbers together
    Given I have entered "<firstValue>" into the calculator
    And I have entered "<secondValue>" into the calculator
    When I press "divide"
    Then the request is successful
    Then the JSON response should have value "<output>"
    Examples:
      | firstValue | secondValue | output |
      | 2          | 5           | 7      |
      | 2          | 5           | 0.4    |
      | 2          | 5           | -3     |

  @functions
  Scenario Outline: As a user, I want to put one number to the power of itself
    Given I have entered "<firstValue>" into the calculator
    When I press "sqrt"
    Then the request is successful
    Then the JSON response should have value "<output>"
    Examples:
      | firstValue | output |
      | 8          | 64     |