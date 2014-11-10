# Bob

Bob is a lackadaisical teenager. ([No, not that lackadaisical teenager](https://github.com/derekprior/exercism/tree/master/javascript/bob).) Sometimes, Bob is happy, and you can kick him in the pants. Sometimes he is sad, and you can tell him a joke.  But being a lackadaisical teenager, Bob doesn't always respond the way you'd expect.

This is an exercise in using functional reactive programming with AJAX using optimistic updates.  Bob lives in the server, in `BobController`, and you control him through `/bob/index`.

When you click the button, two things happen.

1. The client updates to show the *expected* mood.
2. The client asks Bob for the *actual* mood and then shows it when the response comes back.

The response from the server has Bob's updated mood (which may or may not be what we expected), and a message describing what actually happened.  It may take a couple of seconds to come back.

