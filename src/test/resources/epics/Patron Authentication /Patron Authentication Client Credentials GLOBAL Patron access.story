Meta:
@tag
@epic Patron Authentication
@sprint S12 Dublin December 19
@jira SAPI_77,SAPI_80,SAPI_81,SAPI_82
@story Patron Authentication Client Credentials GLOBAL_Patron_access
@created by ssatelle
@date 17 December 2014


Narrative:
 As a 3rd Party Application I want to allow a user/patron to enter their Sierra credentials and obtain an API auth code
 that I can use to get an API access token to allow the 3rd Party Application access to the users/patrons data in Sierra
 Then I test that the correct access is assigned. I also test the outcomes when authenticated using client credentials

Scenario: Authenticate as a user with Global Patron access then query various patrons accounts - Should Work
Given my API Server is defined
When I authenticate at /v2/token with credentials VmcUk7FmyqQ+AD1e+xWO5qq9tgjC:QA_API_GLOBAL_PATRON_Account
Then I should obtain a JSON AUTH message containing my access_token
When I request data from /v2/patrons/1288667
Then I should get a response of: {
    "id": 1288667,
    "expirationDate": "2015-12-31",
    "birthDate": "1952-05-04",
    "patronType": 100,
    "patronCodes": {
        "pcode1": "f",
        "pcode2": "-",
        "pcode3": 0,
        "pcode4": 120
    },
    "homeLibraryCode": "10",
    "message": "-",
    "blockInfo": {
        "code": "-"
    },
    "moneyOwed": 7
}
When I request data from /v2/patrons/2666425
Then I should get a response of: {
    "id": 2666425,
    "expirationDate": "2017-12-31",
    "birthDate": "1935-11-02",
    "patronType": 100,
    "patronCodes": {
        "pcode1": "m",
        "pcode2": "-",
        "pcode3": 0,
        "pcode4": 0
    },
    "homeLibraryCode": "00",
    "message": "-",
    "blockInfo": {
        "code": "-"
    },
    "moneyOwed": 0
}

Scenario: Authenticate as a user with Global Patron access then query bibs and items - Should work
Given my API Server is defined
When I authenticate at /v2/token with credentials VmcUk7FmyqQ+AD1e+xWO5qq9tgjC:QA_API_GLOBAL_PATRON_Account
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
