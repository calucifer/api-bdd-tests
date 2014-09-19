Meta:
@tag BasicTests:PatronTests


Narrative:
As a user
I want to play with bibs
So that I can ensure that they all work ok
Scenario: Login to the seirra-api site and recieve an auth token
Given an authentication url http://10.0.3.72:8080/api/v2/token
When I authenticate with credentials III:password
Then I should obtain a JSON AUTH message containing my access_token

Scenario: login to site and get a list of patrons (limited to 10)
Given a url http://10.0.3.72:8080/api/v2/patrons?limit=10
When I request a list of items
Then I should obtain a list of items like:
{"entries":[{"id":1000001},{"id":1000002},{"id":1000003},{"id":1000004},{"id":1000005},{"id":1000006},{"id":1000007,"expirationDate":"2016-03-24","patronType":20,"patronCodes":{"pcode1":"-","pcode2":"g","pcode3":0,"pcode4":0},"homeLibraryCode":"mh","message":"-","blockInfo":{"code":"-"},"moneyOwed":0.0},{"id":1000008},{"id":1000009},{"id":1000010}]}

Scenario: login to site and get a particular patron
Given a url http://10.0.3.72:8080/api/v2/patrons/1000001
When I request a list of items
Then I should obtain a list of items like:
{"id":1000001}

Scenario: login to site and get a list of patrons with an offset of 2, limted to 8
Given a url http://10.0.3.72:8080/api/v2/patrons/?limit=8&offset=2
When I request a list of items
Then I should obtain a list of items like:
{"entries":[{"id":1000003},{"id":1000004},{"id":1000005},{"id":1000006},{"id":1000007,"expirationDate":"2016-03-24","patronType":20,"patronCodes":{"pcode1":"-","pcode2":"g","pcode3":0,"pcode4":0},"homeLibraryCode":"mh","message":"-","blockInfo":{"code":"-"},"moneyOwed":0.0},{"id":1000008},{"id":1000009},{"id":1000010}]}