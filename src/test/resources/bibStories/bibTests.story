Meta:
@tag BasicTests:bibTests
Narrative:
As a user
I want to play with bibs
So that I can ensure that they all work ok
Scenario: Login to the seirra-api site and recieve an auth token
Given an authentication url http://10.0.3.72:8080/api/v2/token
When I authenticate with credentials III:password
Then I should obtain a JSON AUTH message containing my access_token

Scenario: login to site and get a list of bibs
Given a url http://10.0.3.72:8080/api/v2/bibs?limit=10
When I request a list of items
Then I should obtain a list of items like:
{"entries":[{"id":1000001,"deletedDate":"2004-03-05","deleted":true},{"id":1000002,"deletedDate":"2004-03-12","deleted":true},{"id":1000003,"author":"","title":"Gollumus Frapjaws of Fate","suppressed":false,"bibLevel":{"value":"UNKNOWN","code":"-"},"updatedDate":"2014-05-27T22:12:29Z","publishYear":1979,"materialType":{"value":"UNKNOWN","code":"-"},"deleted":false,"country":{"name":"Zambia","code":"za "}},{"id":1000004,"author":"Duché, Jean.","title":"The great trade routes.","suppressed":false,"bibLevel":{"value":"MONOGRAPH","code":"m"},"catalogDate":"2004-04-08","updatedDate":"2014-06-26T22:39:06Z","publishYear":1969,"materialType":{"value":"PRINTED BK/JNL","code":"a"},"lang":"Chinese","deleted":false,"createdDate":"2004-04-08T23:33:00Z","country":{"name":"Austria","code":"au "}},{"id":1000005,"author":"Crooke, Ray, 1922-","title":"Ray Crooke","suppressed":false,"bibLevel":{"value":"MONOGRAPH","code":"m"},"catalogDate":"2004-04-08","updatedDate":"2014-05-06T16:35:26Z","publishYear":1972,"materialType":{"value":"PRINTED BK/JNL","code":"a"},"lang":"Chinese","deleted":false,"createdDate":"2004-04-08T23:42:00Z","country":{"name":"zc ","code":"zc "}},{"id":1000006,"author":"Santucci, Luigi","title":"Darchy Wrestling with Christ","suppressed":false,"bibLevel":{"value":"MONOGRAPH","code":"m"},"catalogDate":"2004-04-08","updatedDate":"2013-06-05T15:43:32Z","publishYear":1972,"materialType":{"value":"PRINTED BK/JNL","code":"a"},"lang":"Chinese","deleted":false,"createdDate":"2004-04-08T23:42:00Z","country":{"name":"U.S. (state not known)","code":"xxu"}},{"id":1000007,"author":"Christie, Agatha, 1890-1976.","title":"darchy Nemesis with an \u2018ñ\u2019, \u2018l\u2019 and \u2018ł\u2019","suppressed":true,"bibLevel":{"value":"MONOGRAPH","code":"m"},"catalogDate":"2004-04-08","updatedDate":"2013-10-17T15:00:48Z","publishYear":1971,"materialType":{"value":"PRINTED BK/JNL","code":"a"},"lang":"Chinese","deleted":false,"createdDate":"2004-04-08T23:42:13Z","country":{"name":"U.S. (state not known)","code":"xxu"}},{"id":1000008,"author":"Piper, David.","title":"Darchy The companion guide to London.","suppressed":true,"bibLevel":{"value":"MONOGRAPH","code":"m"},"catalogDate":"2004-04-08","updatedDate":"2014-02-11T18:40:28Z","publishYear":1970,"materialType":{"value":"PRINTED BK/JNL","code":"a"},"lang":"Chinese","deleted":false,"createdDate":"2004-04-08T23:42:00Z","country":{"name":"U.S. (state not known)","code":"xxu"}},{"id":1000009,"author":"Haskins, James, 1941-","title":"darchy Snow sculpture and ice carving","suppressed":false,"bibLevel":{"value":"MONOGRAPH","code":"m"},"catalogDate":"2004-04-08","updatedDate":"2014-02-11T18:40:28Z","publishYear":1974,"materialType":{"value":"PRINTED BK/JNL","code":"a"},"lang":"Chinese","deleted":false,"createdDate":"2004-04-08T23:42:00Z","country":{"name":"U.S. (state not known)","code":"xxu"}},{"id":1000010,"author":"Fox, Alan.","title":"darchy A sociology of work in industry.","suppressed":true,"bibLevel":{"value":"MONOGRAPH","code":"m"},"catalogDate":"2004-04-08","updatedDate":"2013-04-25T15:25:20Z","publishYear":1971,"materialType":{"value":"PRINTED BK/JNL","code":"a"},"lang":"Chinese","deleted":false,"createdDate":"2004-04-08T23:42:00Z","country":{"name":"U.S. (state not known)","code":"xxu"}}]}

Scenario: login to site and get a particular bib
Given a url http://10.0.3.72:8080/api/v2/bibs/1000001
When I request a list of items
Then I should obtain a list of items like:
{"id":1000001,"deletedDate":"2004-03-05","deleted":true}