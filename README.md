# Q&A API

* Login system
A Tenant has `full_name` as attribute to perform the Login to get the `access_token`

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


After you get the `access_token` the header of the request should be like This

*Header*
```
{
  "Authentication": "Bearer < access_token >"
}
```
