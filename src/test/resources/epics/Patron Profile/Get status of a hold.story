Meta:
@tag
@epic Patron Profile
@sprint S9 Dublin October 17
@jira SIERRA_16013
@story Get status of a hold
@created by SSatelle
@date 11 November 2014


Narrative:
As an API Consumer
I want to query a patrons holds
and take one through the workflow - while checking it updates correctly
The Hold statuses are
0 On hold.
b Bib hold ready for pickup.
j Volume hold ready for pickup.
i Item hold ready for pickup.
t Bib, item, or volume in transit to pickup location. 

Scenario: login and query a patron with holds
Given my API Server is defined
When I authenticate at /v2/token with my default credentials
Then I should obtain a JSON AUTH message containing my access_token
When I request data from /v2/patrons/1288667/holds?fields=status
Then I should get a response of: {
    "total": 2,
    "entries": [
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/403581",
            "status": {
                "code": "0",
                "name": "On hold."
            }
        },
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/404326",
           "status": {
               "code": "0",
               "name": "On hold."
           }
        }
    ]
}


Scenario: For one of the holds update it's status to b
Given My Default dbConnectString, username and password are defined
When I update the hold 404326 to a status of b
Then the hold status is now t in the database

Scenario: Ensure that the hold I changed the status of is updated and the other is unaffected
Given my API Server is defined
When I authenticate at /v2/token with my default credentials
Then I should obtain a JSON AUTH message containing my access_token
When I request data from /v2/patrons/1288667/holds?fields=status
Then I should get a response of: {
    "total": 2,
    "entries": [
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/403581",
            "status": {
                "code": "0",
                "name": "On hold."
            }
        },
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/404326",
            "status": {
                   "code": "b",
                   "name": "Bib hold ready for pickup."
           }
        }
    ]
}

Scenario: For one of the holds update it's status to j
Given My Default dbConnectString, username and password are defined
When I update the hold 404326 to a status of j
Then the hold status is now j in the database

Scenario: Ensure that the hold I changed the status of is updated and the other is unaffected
Given my API Server is defined
When I authenticate at /v2/token with my default credentials
Then I should obtain a JSON AUTH message containing my access_token
When I request data from /v2/patrons/1288667/holds?fields=status
Then I should get a response of: {
    "total": 2,
    "entries": [
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/403581",
            "status": {
                "code": "0",
                "name": "On hold."
            }
        },
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/404326",
            "status": {
                   "code": "j",
                   "name": "Volume hold ready for pickup."
           }
        }
    ]
}

Scenario: For one of the holds update it's status to i
Given My Default dbConnectString, username and password are defined
When I update the hold 404326 to a status of i
Then the hold status is now i in the database

Scenario: Ensure that the hold I changed the status of is updated and the other is unaffected
Given my API Server is defined
When I authenticate at /v2/token with my default credentials
Then I should obtain a JSON AUTH message containing my access_token
When I request data from /v2/patrons/1288667/holds?fields=status
Then I should get a response of: {
    "total": 2,
    "entries": [
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/403581",
            "status": {
                "code": "0",
                "name": "On hold."
            }
        },
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/404326",
            "status": {
                   "code": "i",
                   "name": "Item hold ready for pickup."
           }
        }
    ]
}

Scenario: For one of the holds update it's status to t
Given My Default dbConnectString, username and password are defined
When I update the hold 404326 to a status of t
Then the hold status is now t in the database

Scenario: Ensure that the hold I changed the status of is updated and the other is unaffected
Given my API Server is defined
When I authenticate at /v2/token with my default credentials
Then I should obtain a JSON AUTH message containing my access_token
When I request data from /v2/patrons/1288667/holds?fields=status
Then I should get a response of: {
    "total": 2,
    "entries": [
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/403581",
            "status": {
                "code": "0",
                "name": "On hold."
            }
        },
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/404326",
            "status": {
                "code": "t",
                "name": "Bib, item, or volume in transit to pickup location."
           }
        }
    ]
}

Scenario: Set the statuses back to as they were at the begining
Given My Default dbConnectString, username and password are defined
When I update the hold 404326 to a status of 0


Given my API Server is defined
When I authenticate at /v2/token with my default credentials
Then I should obtain a JSON AUTH message containing my access_token
When I request data from /v2/patrons/1288667/holds?fields=status
Then I should get a response of: {
    "total": 2,
    "entries": [
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/403581",
            "status": {
                "code": "0",
                "name": "On hold."
            }
        },
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/404326",
           "status": {
               "code": "0",
               "name": "On hold."
           }
        }
    ]
}



