Meta:
@tag
epic Monetization
@sprint S5-Dublin July 25
@jira SIERRA_15579
@story Ability to assign access to methods or routes
@created by ssatelle
@date 24-oct-2014


Narrative:
As a III API developer,
I need the ability to assign API access tier to methods/routes so that libraries can access the appropriate API service tier (Basic or Premium).
@PreReqs:
    Accounts required:
        Account With "Patron Permissions"
        Account without "Patron Permissions"

@pending
Scenario: My Server is configured as a basic install and I get a token for a user WITHOUT "Patron Permissions" and request patron details
Given my default url is defined
And my server is configured as a basic install
When I authenticate at /v2/token with credentials iA0WpsMlc2n8s4bH14fUajDQYqRm:SS_QA_WITHOUT_PatronPerms
Then I should obtain a JSON AUTH message containing my access_token
When I request items from /v2/patrons/1288667
Then I should get a response of: {
    "error": "invalid_token"
}


@pending
Scenario: My Server is configured as a basic install and I get a token for a user WITHOUT "Patron Permissions" and I update a patron record
Given my default url is defined
And my server is configured as a basic install
When I authenticate at /v2/token with credentials ZRgeBGXPP+aZHt96VZzwz8Ei+0uw:SS_QA_Basic_WOPP
Then I should obtain a JSON AUTH message containing my access_token
When I request items from /v2/patrons/1288667
Then I should get a response of: {
     	Access Denied Message
     }


@pending
Scenario: My Server is configured as a basic install and I get a token for a user WITH "Patron Permissions" and request patron details
Given my default url is defined
And my server is configured as a basic install
        When I authenticate at /v2/token with credentials D0Xt2Cs/57J07Ed6kxhEfaN4Db6I:SS_QA_Basic_WPP
Then I should obtain a JSON AUTH message containing my access_token
When I request items from /v2/patrons/1288667
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
    "moneyOwed": 0
}

@pending
Scenario: My Server is configured as a basic install and I get a token for a user WITH "Patron Permissions" and I update a patron record
Given my default url is defined
And my server is configured as a basic install
When I authenticate at /v2/token with credentials ZRgeBGXPP+aZHt96VZzwz8Ei+0uw:SS_QA_Basic_WOPP
Then I should obtain a JSON AUTH message containing my access_token
When I request items from /v2/patrons/1288667
Then I should obtain a list of items like: {
     	Access Denied Message
     }
@pending
Scenario: I need to make my Server a Premium install
Given my server is configured as a basic install
When I configure the server as a premium install
Then my server is configured as a premium install

@pending
Scenario: Get a token for a user WITHOUT "Patron Permissions"
Given a url https://dev-api.iii.com:443/iii/sierra-api
When I authenticate as a user without patron permissions at /v2/token with credentials ZRgeBGXPP+aZHt96VZzwz8Ei+0uw:SS_QA_Basic_WOPP
Then I should obtain a JSON AUTH message containing my access_token

@pending
Scenario: Get a token for a user WITH "Patron Permissions"
Given a url https://dev-api.iii.com:443/iii/sierra-api
When I authenticate as a user with patron permissions at /v2/token with credentials D0Xt2Cs/57J07Ed6kxhEfaN4Db6I:SS_QA_Basic_WPP
Then I should obtain a JSON AUTH message containing my access_token

@pending
Scenario: request patron details as a user with patron permissions
Given I am authenticated as a user with patron access
When I request items from /v2/patrons/1288667
Then I should obtain a list of items like: {
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
    "moneyOwed": 0
}

@pending
Scenario: request patron details as a user without patron permissions
Given I am authenticated as a user without patron access
When I request items from /v2/patrons/1288667
Then I should obtain a list of items like: {
	Access Denied Message
}

Scenario: I'm authenticated as a user WITHOUT patron permissions on a premium server I need to attempt to update a patron record
Given I am authenticated as a user without patron access
When I update a patron record
Then I should obtain a list of items like: {
    Access Denied Message
}

Scenario: I'm authenticated as a user with patron permissions on a premium server I need to update a patron record
Given I am authenticated as a user with patron access
When I update a patron record
Then the update is accepted
??????

Scenario: make sure my update is accepted
Given I am authenticated as a user with patron access
When I request items from /v2/patrons/1288667
Then I should obtain a list of items like: {
    <WHATEVER UPDATE I GO WITH SHOULD BE IN HERE>
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
    "moneyOwed": 0
}


