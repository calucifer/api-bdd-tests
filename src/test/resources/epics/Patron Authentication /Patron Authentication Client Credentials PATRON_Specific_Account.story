Meta:
@tag
@epic Patron Authentication
@sprint S12 Dublin December 19
@jira SAPI_77,SAPI_80,SAPI_81,SAPI_82
@story Patron Authentication Client Credentials PATRON_Specific_Account
@created by ssatelle
@date 17 December 2014


Narrative:
 As a 3rd Party Application I want to allow a user/patron to enter their Sierra credentials and obtain an API auth code
 that I can use to get an API access token to allow the 3rd Party Application access to the users/patrons data in Sierra
 Then I test that the correct access is assigned. I also test the outcomes when authenticated using client credentials

Scenario: Authenticate using client credentials as a user with Patron Specific access only then query various patrons accounts - should fail
Given my API Server is defined
When I authenticate at /v2/token with credentials nlQB1yhgpb9iAM2ryCDcdTK+0I8l:QA_API_PATRON_Specific_Account
Then I should obtain a JSON AUTH message containing my access_token
When I make a bad data request from  /v2/patrons/1288667
Then I should get a http error response of 401 Unauthorized
When I make a bad data request from  /v2/patrons
Then I should get a http error response of 401 Unauthorized


Scenario: Authenticate using client credentials as a user with Patron Specific access only then query bibs and items - Should work
Given my API Server is defined
When I authenticate at /v2/token with credentials nlQB1yhgpb9iAM2ryCDcdTK+0I8l:QA_API_PATRON_Specific_Account
Then I should obtain a JSON AUTH message containing my access_token
When I request data from /v2/bibs/4631933
Then I should get a response of: {
    "id": 4631933,
    "updatedDate": "2014-11-21T14:30:37Z",
    "createdDate": "2014-11-21T12:44:27Z",
    "deleted": false,
    "suppressed": false,
    "title": "QA Volume A",
    "author": "Steven Satelle",
    "materialType": {
        "code": "-"
    },
    "bibLevel": {
        "code": "-"
    },
    "country": {
        "code": "ie ",
        "name": "Ireland"
    }
}
When I request data from /v2/items/7916916
Then I should get a response of: {
    "id": 7916916,
    "updatedDate": "2014-11-21T16:43:22Z",
    "createdDate": "2014-11-21T15:37:06Z",
    "deleted": false,
    "bibIds": [
        4631934
    ],
    "location": {
        "code": "00",
        "name": "King Library"
    },
    "status": {
        "code": "-",
        "display": "AVAILABLE"
    },
    "barcode": "8881000000001"
}
