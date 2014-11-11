Meta:
@tag
@type smoketest
@sprint S1 Dublin May 2
@jira SIERRA_14133

Narrative:
As a developer
I want to Mess with the swagger api
So that I can test its functionality

Scenario: authenticate on swagger site
Given a swagger base url https://dev-api.iii.com/api/swagger
When I authenticate on swagger at /v2/token with credentials iii:94400dev
Then I should obtain a JSON AUTH message containing my access_token