Meta:
@tag
@epic Patron Profile
@sprint S9-Dublin October 17
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
Given my default url is defined
When I authenticate at /v2/token with my default credentials
Then I should obtain a JSON AUTH message containing my access_token
When I request items from /v2/patrons/1288667/holds?fields=status
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

@pending
Scenario: For one of the holds update it's status to t and check its status in the api. Ensure the other hold status hasn't changed
Given a db server devdb-api.iii.com and a hold id 404326
When I update the hold status to t
When I request items from /v2/patrons/1288667/holds/404326?fields=status
Then I should get a response of: {
   "id": "https://devdb-api.iii.com:63300/iii/sierra-api/v2/patrons/1288667/holds/404326",
   "status": {
       "code": "t",
       "name": "Bib, item, or volume in transit to pickup location."
   }
}
When I request items from /v2/patrons/1288667/holds/403581?fields=status
Then I should obtain a list of items like: {
   "id": "https://devdb-api.iii.com:63300/iii/sierra-api/v2/patrons/1288667/holds/403581",
   "status": {
       "code": "0",
       "name": "On hold."
   }
}

@pending
Scenario: For one of the holds update it's status to i and check its status in the api. Ensure the other hold status hasn't changed
Given a db server devdb-api.iii.com and a hold id 404326
When I update the hold status to i
When I request items from /v2/patrons/1288667/holds/404326?fields=status
Then I should obtain a list of items like: {
   "id": "https://devdb-api.iii.com:63300/iii/sierra-api/v2/patrons/1288667/holds/404326",
   "status": {
       "code": "i",
       "name": "Item hold ready for pickup."
   }
}
When I request items from /v2/patrons/1288667/holds/403581?fields=status
Then I should obtain a list of items like: {
   "id": "https://devdb-api.iii.com:63300/iii/sierra-api/v2/patrons/1288667/holds/403581",
   "status": {
       "code": "0",
       "name": "On hold."
   }
}

@pending
Scenario: For one of the holds update it's status to j and check its status in the api. Ensure the other hold status hasn't changed
Given a db server devdb-api.iii.com and a hold id 404326
When I update the hold status to j
When I request items from /v2/patrons/1288667/holds/404326?fields=status
Then I should obtain a list of items like: {
   "id": "https://devdb-api.iii.com:63300/iii/sierra-api/v2/patrons/1288667/holds/404326",
   "status": {
       "code": "j",
       "name": "Volume hold ready for pickup."
   }
}
When I request items from /v2/patrons/1288667/holds/403581?fields=status
Then I should obtain a list of items like: {
   "id": "https://devdb-api.iii.com:63300/iii/sierra-api/v2/patrons/1288667/holds/403581",
   "status": {
       "code": "0",
       "name": "On hold."
   }
}

@pending
Scenario: For one of the holds update it's status to b and check its status in the api. Ensure the other hold status hasn't changed
Given a db server devdb-api.iii.com and a hold id 404326
When I update the hold status to b
When I request items from /v2/patrons/1288667/holds/404326?fields=status
Then I should obtain a list of items like: {
   "id": "https://devdb-api.iii.com:63300/iii/sierra-api/v2/patrons/1288667/holds/404326",
   "status": {
       "code": "b",
       "name": "Bib hold ready for pickup."
   }
}
When I request items from /v2/patrons/1288667/holds/403581?fields=status
Then I should obtain a list of items like: {
   "id": "https://devdb-api.iii.com:63300/iii/sierra-api/v2/patrons/1288667/holds/403581",
   "status": {
       "code": "0",
       "name": "On hold."
   }
}

@pending
Scenario: For one of the holds update it's status to 0 and check its status in the api. Ensure the other hold status hasn't changed
Given a db server devdb-api.iii.com and a hold id 404326
When I update the hold status to 0
When I request items from /v2/patrons/1288667/holds/404326?fields=status
Then I should obtain a list of items like: {
   "id": "https://devdb-api.iii.com:63300/iii/sierra-api/v2/patrons/1288667/holds/404326",
   "status": {
       "code": "0",
       "name": "On hold."
   }
}
When I request items from /v2/patrons/1288667/holds/403581?fields=status
Then I should obtain a list of items like: {
   "id": "https://devdb-api.iii.com:63300/iii/sierra-api/v2/patrons/1288667/holds/403581",
   "status": {
       "code": "0",
       "name": "On hold."
   }
}



