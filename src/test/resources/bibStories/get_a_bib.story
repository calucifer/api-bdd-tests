
Narrative:
As a user
I want to play with bibs
So that I can achieve a business goal
Scenario: Login to the seirra-api site and recieve an auth token
Given an authentication url http://10.0.3.72:8080/api/v2/token
When I authenticate with credentials III:password
Then I should obtain a JSON AUTH message containing my access_token

Scenario: login to site and get a list of bibs
Given a url http://10.0.3.72:8080/api/v2/bibs
When I request a list of bibs
Then I should obtain a list of bibs

Scenario: login to site and get a particular bib
Given a url http://10.0.3.72:8080/api/v2/bibs
When I request a particular bib with id 1000001
Then The bib returned should have an id 1000001