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
      | 100        | 80          | 180    |
      | 100        | 0           | 100    |
      | 100        | -90         | 10     |
      | 0          | 0           | 0      |
      | 0          | 80          | 80     |
      | 0          | -90         | -90    |
      | -99        | 100         | 1      |
      | -99        | 0           | -99    |
      | -99        | -100        | -199   |


  @functions
  Scenario Outline: As a user, I want to subtract numbers together
    Given I have entered "<firstValue>" into the calculator
    And I have entered "<secondValue>" into the calculator
    When I press "minus"
    Then the request is successful
    Then the JSON response should have value "<output>"
    Examples:
      | firstValue | secondValue | output |
      | 100        | 80          | 20     |
      | 100        | 0           | 100    |
      | 100        | -90         | 190    |
      | 0          | 0           | 0      |
      | 0          | 80          | -80    |
      | 0          | -90         | 90     |
      | -99        | 100         | -199   |
      | -99        | 0           | -99    |
      | -99        | -100        | 1      |

  @functions
  Scenario Outline: As a user, I want to multiply numbers together
    Given I have entered "<firstValue>" into the calculator
    And I have entered "<secondValue>" into the calculator
    When I press "multiply"
    Then the request is successful
    Then the JSON response should have value "<output>"
    Examples:
      | firstValue | secondValue | output |
      | 100        | 80          | 8000   |
      | 100        | 0           | 0      |
      | 100        | -90         | -9000  |
      | 0          | 0           | 0      |
      | 0          | 80          | 0      |
      | 0          | -90         | 0      |
      | -99        | 100         | -9900  |
      | -99        | 0           | 0      |
      | -99        | -100        | 9900   |

  @functions
  Scenario Outline: As a user, I want to divide numbers together
    Given I have entered "<firstValue>" into the calculator
    And I have entered "<secondValue>" into the calculator
    When I press "divide"
    Then the request is successful
    Then the JSON response should have value "<output>"
    Examples:
      | firstValue | secondValue | output             |
      | 50         | 20          | 2.5                |
      | 0          | 20          | 0                  |
      | -15        | 20          | -0.75              |
      | -3.123     | 5           | -0.6246            |
      | -5         | 3.123       | -1.601024655779699 |
      | 4.21       | 3           | 1.403333333333333  |
      | 10         | 3.123       | 3.202049311559398  |
      | 0.234      | 3.123       | 0.0749279538904899 |
      | 15         | 0           | error              |
      | 1.23456789 | 2.10987654  | 0.5851375028796709 |

  @functions
  Scenario Outline: As a user, I want to put one number onto itself
    Given I have entered "<firstValue>" into the calculator
    When I press "sqrt"
    Then the request is successful
    Then the JSON response should have value "<output>"
    Examples:
      | firstValue | output |
      | 0          | 0      |
      | -10        | NaN  |
      | 50         | 7.0710678118654755   |
      | 50.0       | 7.0710678118654755   |

