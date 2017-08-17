This is a Rails backend for a React client.

# Authentication with JWT
Requests should be formed like the following.
Your json should follow this pattern;

## Signup

```json
{
  "user": {
    "username": "someusername",
    "password": "default",
    "email": "someusername@gmail.com"
  }
}
```

## Login

```json
{
  "password": "default",
  "email": "yiannakokalas@gmail.com"
}
```

## Making a `fetch()` request

After you login you will receive a long hash. Use that to authenticate all
requests that require authentication. When authentication make sure to use
a key of `Authorization` pointing to a value being the hash that was returned
from logging in.

```js
fetch('http://localhost:3001/deals', {
    method: 'GET',
    headers: {
        'Authorization': 'your_long_hash_goes_here'
    }
  })
  .then(response => response.json())
  .then(json => console.log(json))
  .catch(err => console.log(err))
```
