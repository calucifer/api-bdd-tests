Meta:
@tag 
@epic Patron Authentication
@sprint S12 Dublin December 19
@jira SAPI_77,SAPI_80,SAPI_81,SAPI_82
@story Patron Authentication Auth Code Flow
@created by ssatelle
@date 16 December 2014

Narrative:
 As a 3rd Party Application I want to allow a user/patron to enter their Sierra credentials and obtain an API auth code
 that I can use to get an API access token to allow the 3rd Party Application access to the users/patrons data in Sierra
 Then I test that the correct access is assigned

Scenario: Authenticate as a user with Patron Specific and Global Patron Access on a 3rd party site
Given my API Server is defined
When I authenticate on the 3rd party site http://test.redirect.ie at /v2/token with credentials i4TOpLg7BapHsZD46Z26gTnPv2qI:QA_API_PATRON_Specific_And_Global_Account
Then I am redirected to the url
When I do something
Then I get a result

