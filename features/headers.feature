Feature: We can inspect the headers of the response

  @header
  Scenario Outline: As a user, I want to check for multiple headers
    When I send a GET request for "http://localhost:8080/math/add?a=-101&b=-101"
    Then the request was successful
    Then the response has the header "<header>" with the value "<value>"
    Examples:
      | header            | value                          |
      | content_type      | application/json;charset=UTF-8 |
      | transfer_encoding | chunked                        |
