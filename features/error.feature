Feature:  Handling error responses

  @error
  Scenario Outline: As a user, I want to handle error response for ADD operator
    Given I have entered "<firstValue>" into the calculator
    And I have entered "<secondValue>" into the calculator
    When I press "<operation>"
    Then the response has "<statusCode>" and "<value>"
    Examples:
      | firstValue | secondValue | operation | statusCode | value       |
      | 1          | y           | add       | 400        | Bad Request |
      | 1          | 5.0         | add       | 400        | Bad Request |
      | 1          |             | add       | 400        | Bad Request |
      | 1          | 5           | invalid   | 404        | Not Found   |

  @error
  Scenario Outline: As a user, I want to handle error response for Minus operator
    Given I have entered "<firstValue>" into the calculator
    And I have entered "<secondValue>" into the calculator
    When I press "<operation>"
    Then the response has "<statusCode>" and "<value>"
    Examples:
      | firstValue | secondValue | operation | statusCode | value       |
      | 1          | y           | minus     | 400        | Bad Request |
      | 1          | 5.0         | minus     | 400        | Bad Request |
      | 1          |             | minus     | 400        | Bad Request |
      | --1          |   3          | minus     | 400        | Bad Request |
      | 1          | 5           | invalid   | 404        | Not Found   |

  @error
  Scenario Outline: As a user, I want to handle error response for multiply operator
    Given I have entered "<firstValue>" into the calculator
    And I have entered "<secondValue>" into the calculator
    When I press "<operation>"
    Then the response has "<statusCode>" and "<value>"
    Examples:
      | firstValue | secondValue | operation | statusCode | value       |
      | 1          | y           | multiply  | 400        | Bad Request |
      | 1          | 5.0         | multiply  | 400        | Bad Request |
      | 1          |             | multiply  | 400        | Bad Request |
      | 1          | 5           | invalid   | 404        | Not Found   |

  @error
  Scenario Outline: As a user, I want to handle error response for divide operator
    Given I have entered "<firstValue>" into the calculator
    And I have entered "<secondValue>" into the calculator
    When I press "<operation>"
    Then the response has "<statusCode>" and "<value>"
    Examples:
      | firstValue | secondValue | operation | statusCode | value       |
      | 1          | y           | divide    | 400        | Bad Request |
      | 1          |             | divide    | 400        | Bad Request |
      | 1          | 5           | invalid   | 404        | Not Found   |

  @error
  Scenario Outline: As a user, I want to handle error response for square root operator
    Given I have entered "<firstValue>" into the calculator
    And I press "<operation>"
    Then the response has "<statusCode>" and "<value>"
    Examples:
      | firstValue | operation | statusCode | value       |
      |            | sqrt      | 400        | Bad Request |
      | 1          | invalid   | 404        | Not Found   |
