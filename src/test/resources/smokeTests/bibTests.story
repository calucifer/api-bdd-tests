Meta:
@tag BasicTests:bibTests
Narrative:
As a user
I want to play with bibs
So that I can ensure that they all work ok


Scenario: Login to the seirra-api site and recieve an auth token
Given a url https://dev-api.iii.com:443/iii/sierra-api
When I authenticate at /v2/token with credentials III:91396dev
Then I should obtain a JSON AUTH message containing my access_token

Scenario: login to site and get a list of bibs
Given a url https://dev-api.iii.com:443/iii/sierra-api
When I request items from /v2/bibs?limit=10
Then I should obtain a list of items like: {
"entries": [
  {
      "id": 1000001,
      "updatedDate": "2009-07-06T15:30:13Z",
      "createdDate": "2003-05-08T15:55:00Z",
      "deleted": false,
      "suppressed": false,
      "title": "Hey, what's wrong with this one?",
      "author": "Wojciechowska, Maia, 1927-",
      "materialType": {
          "code": "a",
          "value": "Book"
      },
      "bibLevel": {
          "code": "m",
          "value": "MONOGRAPH"
      },
      "publishYear": 1969,
      "catalogDate": "1990-10-10",
      "country": {
          "code": "nyu",
          "name": "New York (State)"
      }
  },
  {
      "id": 1000002,
      "updatedDate": "2008-07-17T04:05:25Z",
      "createdDate": "2003-05-08T15:55:13Z",
      "deleted": false,
      "suppressed": false,
      "title": "The organization of the boot and shoe industry in Massachusetts before 1875.",
      "author": "Hazard, Blanche Evans.",
      "materialType": {
          "code": "a",
          "value": "Book"
      },
      "bibLevel": {
          "code": "m",
          "value": "MONOGRAPH"
      },
      "publishYear": 1969,
      "catalogDate": "1990-10-10",
      "country": {
          "code": "nyu",
          "name": "New York (State)"
      }
  },
  {
      "id": 1000003,
      "updatedDate": "2004-10-04T19:17:45Z",
      "createdDate": "2003-05-08T15:55:13Z",
      "deleted": false,
      "suppressed": false,
      "title": "Monotheism and Moses,",
      "author": "Christen, Robert J.",
      "materialType": {
          "code": "a",
          "value": "Book"
      },
      "bibLevel": {
          "code": "m",
          "value": "MONOGRAPH"
      },
      "publishYear": 1969,
      "catalogDate": "1990-10-10",
      "country": {
          "code": "mau",
          "name": "Massachusetts"
      }
  },
  {
      "id": 1000004,
      "updatedDate": "2006-07-17T16:34:10Z",
      "createdDate": "2003-05-08T15:55:13Z",
      "deleted": false,
      "suppressed": false,
      "title": "Socialism in Cuba,",
      "author": "Huberman, Leo, 1903-1968.",
      "materialType": {
          "code": "a",
          "value": "Book"
      },
      "bibLevel": {
          "code": "m",
          "value": "MONOGRAPH"
      },
      "publishYear": 1969,
      "catalogDate": "1990-10-10",
      "country": {
          "code": "nyu",
          "name": "New York (State)"
      }
  },
  {
      "id": 1000005,
      "updatedDate": "2004-10-04T19:17:45Z",
      "createdDate": "2003-05-08T15:55:13Z",
      "deleted": false,
      "suppressed": false,
      "title": "The Soviet economy; structure, principles, problems.",
      "author": "Spulber, Nicolas.",
      "materialType": {
          "code": "a",
          "value": "Book"
      },
      "bibLevel": {
          "code": "m",
          "value": "MONOGRAPH"
      },
      "publishYear": 1969,
      "catalogDate": "1990-10-10",
      "country": {
          "code": "nyu",
          "name": "New York (State)"
      }
  },
  {
      "id": 1000006,
      "deletedDate": "2005-09-30",
      "deleted": true
  },
  {
      "id": 1000007,
      "updatedDate": "2009-01-02T17:41:53Z",
      "createdDate": "2003-05-08T15:55:14Z",
      "deleted": false,
      "suppressed": false,
      "title": "Basic circuit theory",
      "author": "Desoer, Charles A.",
      "materialType": {
          "code": "a",
          "value": "Book"
      },
      "bibLevel": {
          "code": "m",
          "value": "MONOGRAPH"
      },
      "publishYear": 1969,
      "catalogDate": "1990-10-10",
      "country": {
          "code": "nyu",
          "name": "New York (State)"
      }
  },
  {
      "id": 1000008,
      "updatedDate": "2006-07-17T16:34:10Z",
      "createdDate": "2003-05-08T15:55:14Z",
      "deleted": false,
      "suppressed": false,
      "title": "The crisis in the German social-democracy.",
      "author": "Luxemburg, Rosa, 1871-1919.",
      "materialType": {
          "code": "a",
          "value": "Book"
      },
      "bibLevel": {
          "code": "m",
          "value": "MONOGRAPH"
      },
      "publishYear": 1969,
      "catalogDate": "1990-10-10",
      "country": {
          "code": "nyu",
          "name": "New York (State)"
      }
  },
  {
      "id": 1000009,
      "updatedDate": "2012-03-20T11:44:55Z",
      "createdDate": "2003-05-08T15:55:14Z",
      "deleted": false,
      "suppressed": false,
      "title": "Seashells of North America; a guide to field identification,",
      "author": "Abbott, R. Tucker (Robert Tucker), 1919-1995.",
      "materialType": {
          "code": "a",
          "value": "Book"
      },
      "bibLevel": {
          "code": "m",
          "value": "MONOGRAPH"
      },
      "publishYear": 1968,
      "catalogDate": "1990-10-10",
      "country": {
          "code": "nyu",
          "name": "New York (State)"
      }
  },
  {
      "id": 1000010,
      "updatedDate": "2012-09-26T16:03:10Z",
      "createdDate": "2003-05-08T15:55:14Z",
      "deleted": false,
      "suppressed": false,
      "title": "Japan and Korea",
      "author": "Clayton, Robert.",
      "materialType": {
          "code": "a",
          "value": "Book"
      },
      "bibLevel": {
          "code": "m",
          "value": "MONOGRAPH"
      },
      "publishYear": 1974,
      "catalogDate": "1990-10-10",
      "country": {
          "code": "nyu",
          "name": "New York (State)"
      }
  }
]
}


Scenario: login to site and get a particular bib
Given a url https://dev-api.iii.com:443/iii/sierra-api
When I request items from /v2/bibs/1000001
Then I should obtain a list of items like: {
	id: 1000001,
	updatedDate: "2009-07-06T15:30:13Z",
	createdDate: "2003-05-08T15:55:00Z",
	deleted: false,
	suppressed: false,
    title: "Hey, what's wrong with this one?",
	author: "Wojciechowska, Maia, 1927-",
	materialType:{code: "a", value: "Book"},
	bibLevel:{code: "m", value: "MONOGRAPH"},
	publishYear: 1969,
	catalogDate: "1990-10-10",
	country:{code: "nyu", name: "New York (State)"}
},