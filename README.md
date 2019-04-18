# URL Shortener: Part SQL

In this project, we'll build a tool that will take an arbitrarily-long URL and will shorten it for the user. Subsequent users can then give the short URL back to our tool and be redirected to the original URL. We'll also track clickthroughs, since these can be really helpful for business analytics.

URL-shortening apps like ours are useful for embedding long URLs in space-constrained messages like tweets. You can play around with Google's shortener if you'd like to get a feel for how this works.

Unfortunately, we don't know how to build things in the browser yet, so we'll have to be content with a simple CLI tool, though we can use the launchy gem to pop open the original URL in a browser.

## Learning Goals

- Be able to create a new Rails project
- Be able to navigate a Rails project using the keyboard
- Be able to change the database using migrations
- Be able to write both database constraints and model-level validations
- Be able to write associations
- Understand the purpose of adding an index to columns in our database
