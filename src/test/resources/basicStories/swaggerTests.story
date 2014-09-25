Meta:
@tag area:swagger epic:test, sprint:none, jira:swagger

Narrative:
As a developer
I want to Mess with the swagger api
So that I can test its functionality

Scenario: authenticate on swagger site
Given a swagger url https://dev-api.iii.com/iii/sierra-api/v2/token
When I authenticate on swagger with credentials cCkkd/pFIW/UHKtR1uFlqxFrIDxE:EIGHTCHAR
Then I should obtain a JSON AUTH message containing my access_token

