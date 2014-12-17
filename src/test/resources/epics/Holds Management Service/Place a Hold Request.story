Meta:
@tag 
@epic Patron Authentication
@sprint S11 Dublin November 28
@jira SIERRA_16138, SIERRA_16136, SIERRA_16137
@story Place a hold request for a Patron
@created by ssatelle
@date 25/11/14


Narrative:
As a user
I want to do something
So that I can ensure that it works

Scenario: Place a Hold request for a patron - at BIB level
Given my API Server is defined
When I authenticate at /v2/token with my default credentials
Then I should obtain a JSON AUTH message containing my access_token
When I request data from /v2/patrons/2666427/holds?fields=id
Then I should get a response of: {
    "total": 0,
    "entries": [
    ]
}
When I request data from /v2/patrons/2666425/holds?fields=id
Then I should get a response of: {
    "total": 1,
    "entries": [
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/406118"
        }
    ]
}
When I request data from /v2/patrons/holds/406118
Then I should get a response of: {
    "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/406118",
    "record": "https://dev-api.iii.com/iii/sierra-api/v2/items/7916916",
    "patron": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/2666425",
    "frozen": false,
    "placed": "2014-11-21",
    "notWantedBeforeDate": "2014-11-21",
    "pickupLocation": {
        "code": "14",
        "name": "Evergreen"
    },
    "status": {
        "code": "0",
        "name": "On hold."
    },
    "recordType": "i",
    "patronName": {
        "firstName": "",
        "middleName": "",
        "lastName": "QA Patron A"
    },
    "priority": 0
}
When I request data from /v2/bibs/4631934
Then I should get a response of: {
    "id": 4631934,
    "updatedDate": "2014-11-25T14:46:06Z",
    "createdDate": "2014-11-21T15:03:51Z",
    "deleted": false,
    "suppressed": false,
    "title": "QA Volume B",
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
When I post items to <whatever syntax I use here>
Then I should get a response of:
<whatever response I've to get>
Then I sleep for 60 seconds
When I request data from /v2/patrons/2666427/holds?fields=id
Then I should get a response of: {
    "total": 1,
    "entries": [
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/<THE HOLD ID WILL GO HERE>"
        }
    ]
}
When I request data from /v2/patrons/holds/406118
Then I should get a response of: {
    "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/406118",
    "record": "https://dev-api.iii.com/iii/sierra-api/v2/items/7916916",
    "patron": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/2666425",
    "frozen": false,
    "placed": "2014-11-21",
    "notWantedBeforeDate": "2014-11-21",
    "pickupLocation": {
        "code": "14",
        "name": "Evergreen"
    },
    "status": {
        "code": "0",
        "name": "On hold."
    },
    "recordType": "i",
    "patronName": {
        "firstName": "",
        "middleName": "",
        "lastName": "QA Patron A"
    },
    "priority": 0
}
Then I reset the holds to the way they where at the start

Scenario: Place a Hold request for a patron - at ITEM level
Given my API Server is defined
When I authenticate at /v2/token with my default credentials
Then I should obtain a JSON AUTH message containing my access_token
When I request data from /v2/patrons/2666427/holds?fields=id
Then I should get a response of: {
    "total": 0,
    "entries": [
    ]
}
When I request data from /v2/patrons/2666425/holds?fields=id
Then I should get a response of: {
    "total": 1,
    "entries": [
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/406118"
        }
    ]
}
When I request data from /v2/patrons/holds/406118
Then I should get a response of: {
    "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/406118",
    "record": "https://dev-api.iii.com/iii/sierra-api/v2/items/7916916",
    "patron": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/2666425",
    "frozen": false,
    "placed": "2014-11-21",
    "notWantedBeforeDate": "2014-11-21",
    "pickupLocation": {
        "code": "14",
        "name": "Evergreen"
    },
    "status": {
        "code": "0",
        "name": "On hold."
    },
    "recordType": "i",
    "patronName": {
        "firstName": "",
        "middleName": "",
        "lastName": "QA Patron A"
    },
    "priority": 0
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

When I post items to <whatever syntax I use here>
Then I should get a response of:
<whatever response I've to get>
Then I sleep for 60 seconds
When I request data from /v2/patrons/2666427/holds?fields=id
Then I should get a response of: {
    "total": 1,
    "entries": [
        {
            "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/<THE HOLD ID WILL GO HERE>"
        }
    ]
}
When I request data from /v2/patrons/holds/406118
Then I should get a response of: {
    "id": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/holds/406118",
    "record": "https://dev-api.iii.com/iii/sierra-api/v2/items/7916916",
    "patron": "https://dev-api.iii.com/iii/sierra-api/v2/patrons/2666425",
    "frozen": false,
    "placed": "2014-11-21",
    "notWantedBeforeDate": "2014-11-21",
    "pickupLocation": {
        "code": "14",
        "name": "Evergreen"
    },
    "status": {
        "code": "0",
        "name": "On hold."
    },
    "recordType": "i",
    "patronName": {
        "firstName": "",
        "middleName": "",
        "lastName": "QA Patron A"
    },
    "priority": 0
}
Then I reset the holds to the way they where at the start


