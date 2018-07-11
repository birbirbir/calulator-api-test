Feature:  Handling error responses

  @error
  Scenario Outline: As a user, I want to handle error response for ADD operator
    Given I have entered "<firstValue>" into the calculator
    And I have entered "<secondValue>" into the calculator
    When I press "add"
    Then the response has "<statusCode>" and "<value>"
    Examples:
      | firstValue | secondValue | statusCode | value       |
      | 1          | y           | 400        | Bad Request |

  @error
  Scenario Outline: As a user, I want to handle error response for Minus operator
    Given I have entered "<firstValue>" into the calculator
    And I have entered "<secondValue>" into the calculator
    When I press "add"
    Then the response has "<statusCode>" and "<value>"
    Examples:
      | firstValue | secondValue | statusCode | value       |
      | 1          | y           | 400        | Bad Request |

  @error
  Scenario Outline: As a user, I want to handle error response for multiply operator
    Given I have entered "<firstValue>" into the calculator
    And I have entered "<secondValue>" into the calculator
    When I press "add"
    Then the response has "<statusCode>" and "<value>"
    Examples:
      | firstValue | secondValue | statusCode | value       |
      | 1          | y           | 400        | Bad Request |

  @error
  Scenario Outline: As a user, I want to handle error response for divide operator
    Given I have entered "<firstValue>" into the calculator
    And I have entered "<secondValue>" into the calculator
    When I press "add"
    Then the response has "<statusCode>" and "<value>"
    Examples:
      | firstValue | secondValue | statusCode | value       |
      | 1          | y           | 400        | Bad Request |

  Scenario Outline: As a user, I want to handle error response for sqrt operator
    Given I have entered "<firstValue>" into the calculator
    And I have entered "<secondValue>" into the calculator
    When I press "add"
    Then the response has "<statusCode>" and "<value>"
    Examples:
      | firstValue | secondValue | statusCode | value       |
      | 1          | y           | 400        | Bad Request |