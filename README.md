# Q&A API
Heroku URL: https://salty-stream-55818.herokuapp.com/

 API call example `GET` `https://salty-stream-55818.herokuapp.com/auth/login`


Login system

- A Tenant has `full_name` as attribute to perform the Login to get the `access_token`

*Request*
`POST` `server_url:3000/auth/login`

```
{
  "full_name": "Johnny Kristine Sauer"
}
```

*Response*
```
{
    "access_token": < access_token >,
    "message": "Login Successful"
}
```

You can test the API with the following Tenant

`full_name` : `Altoros`


After you get the `access_token` the header of the request should be like this:

*Header*
```
{
  "Authorization": "Bearer < access_token >"
}
```

* Search

To perform a search in the system its mandatory the next pattern:

*Request*
`GET` `server_url:3000/api/v1/questions/list?search=minus,nulla`

Note: param `search` and the terms must be separeted by a comma `,` (if there more than one term to look for)

*Response*
```
[
    {
        "id": 2,
        "content": "Beatae minus nulla autem?",
        "answers": [
            {
                "id": 386,
                "content": "Voluptatem ducimus vero pariatur.",
                "user": {
                    "id": 33,
                    "full_name": "Phil Ulysses Barton"
                }
            },
            {
                "id": 1052,
                "content": "Numquam consequatur earum et.",
                "user": {
                    "id": 2,
                    "full_name": "Wes Allan Kiehn"
                }
            },
            {
                "id": 1240,
                "content": "Eos accusantium nesciunt omnis.",
                "user": {
                    "id": 62,
                    "full_name": "Stacy Jannette Fahey II"
                }
            },
            {
                "id": 1407,
                "content": "Et quas sed delectus.",
                "user": {
                    "id": 29,
                    "full_name": "Pasquale Tanesha Lebsack MD"
                }
            }
        ],
        "user": {
            "id": 69,
            "full_name": "Emmitt Wilford Douglas"
        }
    }
]
```
