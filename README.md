# Storyline API

This is a Rails API for a React-Redux project called Storyline, to see that project's repo [click here](https://github.com/OccassionalDev/storyline). This API uses Rails' cookies and sessions to authenticate users and send data on user accounts, stories, and characters, and any created comments. Additionally, users can create comments on character and story pages, only if they are logged in.

# Installation and Usage

To install this API, fork and clone this repo to get it, and then run `bundle install` to get all the gems required to run, and then do `rails db:migrate`, and then `rails db:seed` to get the database filled with test accounts, stories, characters and comments. Once the database is all migrated in to and seeded, run `rails s` to start up a rails server on port 3001 to be able to start sending requests to this API.

# Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/OccassionalDev/storyline-api-fixed. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://www.contributor-covenant.org/) code of conduct.
