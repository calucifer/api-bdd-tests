

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal



Meta:@id2
Scenario: login to site and get a list of bibs

Given a rest token http://10.0.3.72:8080/api/v2/bibs
When I authenticate on site using credentials I have
Then I should obtain a list of bibs