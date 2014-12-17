Meta:
@tag
@epic Patron Profile
@sprint S10 Dublin November 7
@jira SIERRA_16349
@story Get place in line of hold
@created by SSatelle
@date 10 November 2014



Narrative:
Test the Place in line of a hold.
When I get a hold ID, I should be able to query its position in the hold queue for that item
When I change the position, it should the change the result given

Scenario: get a list of holds for a patron, getting the hold id, the patron record, the record (item) and the priorities
Given my API Server is defined
When I authenticate at /v2/token with my default credentials
Then I should obtain a JSON AUTH message containing my access_token
When I request data from /v2/patrons/1288667/holds?fields=id,record,patron,priority
Then I should get a response of: {
    "total": 2,
    "entries": [
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/403581",
            "record": "https://dev-api.iii.com/iii/sierra-api/v2/bibs/4597046",
            "patron": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/1288667",
            "priority": 66
        },
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/404326",
            "record": "https://dev-api.iii.com/iii/sierra-api/v2/items/6566413",
            "patron": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/1288667",
            "priority": 0
        }
    ]
}

Scenario: get the id,record,patron,priority for specific holds
Given my API Server is defined
When I authenticate at /v2/token with my default credentials
Then I should obtain a JSON AUTH message containing my access_token
When I request data from /v2/patrons/holds/403581?fields=id,record,patron,priority
Then I should get a response of: {
    "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/403581",
    "record": "https://dev-api.iii.com/iii/sierra-api/v2/bibs/4597046",
    "patron": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/1288667",
    "priority": 66
}
When I request data from /v2/patrons/holds/404326?fields=id,record,patron,priority
Then I should get a response of: {
    "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/404326",
    "record": "https://dev-api.iii.com/iii/sierra-api/v2/items/6566413",
    "patron": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/1288667",
    "priority": 0
}

Scenario: For one of the holds update it's priority to 10
Given My Default dbConnectString, username and password are defined
When I update the database entry for the hold 404326 to a priority of 10
Then the hold priority is now 10 in the database


Scenario: confirm it has changed in the api, confirm the other doesn't change
Given my API Server is defined
When I authenticate at /v2/token with my default credentials
Then I should obtain a JSON AUTH message containing my access_token
When I request data from /v2/patrons/holds/403581?fields=id,record,patron,priority
Then I should get a response of: {
    "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/403581",
    "record": "https://dev-api.iii.com/iii/sierra-api/v2/bibs/4597046",
    "patron": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/1288667",
    "priority": 66
}
When I request data from /v2/patrons/holds/404326?fields=id,record,patron,priority
Then I should get a response of: {
    "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/404326",
    "record": "https://dev-api.iii.com/iii/sierra-api/v2/items/6566413",
    "patron": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/1288667",
    "priority": 10
}

Scenario: change the priority back to as it was at the start
Given My Default dbConnectString, username and password are defined
When I update the database entry for the hold 404326 to a priority of 0
Then the hold priority is now 0 in the database
Given my API Server is defined
When I authenticate at /v2/token with my default credentials
Then I should obtain a JSON AUTH message containing my access_token
When I request data from /v2/patrons/1288667/holds?fields=id,record,patron,priority
Then I should get a response of: {
    "total": 2,
    "entries": [
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/403581",
            "record": "https://dev-api.iii.com/iii/sierra-api/v2/bibs/4597046",
            "patron": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/1288667",
            "priority": 66
        },
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/404326",
            "record": "https://dev-api.iii.com/iii/sierra-api/v2/items/6566413",
            "patron": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/1288667",
            "priority": 0
        }
    ]
}