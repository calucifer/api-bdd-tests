Meta:

Narrative:
As a user
I want to play with patrons
So that I can achieve a business goal

Scenario: Login to the seirra-api site and recieve an auth token
Given an authentication url http://10.0.3.72:8080/api/v2/token
When I authenticate with credentials III:password
Then I should obtain a JSON AUTH message containing my access_token

Scenario: get back a list of patrons
Given a patron url http://10.0.3.72:8080/api/v2/patrons
When I request a list of patrons
Then I should obtain a list of patrons

Scenario: get back a single patron
Given a patron url http://10.0.3.72:8080/api/v2/patrons
When I get the patron 1000001
Then the patron returned should have id 1000001