Meta:
@tag epic:Patron Profile, sprint:S5-Dublin July 25, jira:SIERRA-15655



Narrative:
As an API Consumer
I want to retrieve a patron's full record information
So that I can display this information to the user.

Scenario: Login to the seirra-api site and recieve an auth token
Given a url http://10.0.3.72:8080/api
When I authenticate at /v2/token with credentials III:password
Then I should obtain a JSON AUTH message containing my access_token

Scenario: retrieve the full record for a patron
Given a url http://10.0.3.72:8080/api
When I request items from /v2/patrons/1000007
Then I should obtain a list of items like:
{
"id":1000007,
"expirationDate":"2016-03-24",
"patronType":20,
"patronCodes":{
"pcode1":"-",
"pcode2":"g",
"pcode3":0,
"pcode4":0
},
"homeLibraryCode":"mh",
"message":"-",
"blockInfo":{
"code":"-"
},
"moneyOwed":0.0
}

Scenario: retrieve the full record for a patron
Given a url http://10.0.3.72:8080/api
When I request items from /v2/patrons/1007205
Then I should obtain a list of items like:
{
"id":1007205,
"expirationDate":"2016-03-24",
"patronType":20,
"patronCodes":{
"pcode1":"-",
"pcode2":"g",
"pcode3":0,
"pcode4":0
},
"homeLibraryCode":"mh",
"message":"-",
"blockInfo":{
"code":"-"
},
"moneyOwed":0.0
}

Scenario: retrieve the full record for another different patron
Given a url http://10.0.3.72:8080/api
When I request items from /v2/patrons/2666422
Then I should obtain a list of items like:
{
      "id": 2666422,
      "expirationDate": "2017-12-31",
      "birthDate": "1976-11-03",
      "patronType": 100,
      "patronCodes": {
        "pcode1": "m",
        "pcode2": "-",
        "pcode3": 0,
        "pcode4": 0
      },
      "homeLibraryCode": "10",
      "message": " ",
      "blockInfo": {
        "code": "-"
      },
      "moneyOwed": 0
    }
  ]
}