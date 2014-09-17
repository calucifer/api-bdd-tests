Meta:@id1

Narrative:
As a user I need an authentication token in order to perform all other tests
So I want to login to get an authentication token

Scenario: Login to the seirra-api site and recieve an auth token
Given a url http://10.0.3.72:8080/api/v2/token
When I authenticate with credentials III:password
Then I should obtain a JSON AUTH message containing my access_token



