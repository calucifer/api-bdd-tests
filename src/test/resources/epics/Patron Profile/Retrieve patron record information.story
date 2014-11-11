Meta:
@tag
@epic Patron Profile
@sprint S5-Dublin July 25
@jira SIERRA_15925
@story Retrieve patron record information
@created by ssatelle
@date 24-oct-2014



Narrative:
As an API Consumer
I want to retrieve a patron's default record information

Scenario: Login to the seirra-api and query a few patrons
Given my default url and credentials are defined
When I authenticate at /v2/token with my default credentials
Then I should obtain a JSON AUTH message containing my access_token
When I request items from /v2/patrons/1000007
Then I should get a response of: {
   "id": 1000007
}
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
  "moneyOwed": 7.0
}
