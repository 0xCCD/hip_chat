# HipChat

Easily control [HipChat](https://www.hipchat.com) with Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hip_chat'
```

and run `bundle install`

## Features

Currently, this gem lets you view, edit, create, and destroy users on HipChat.

## Features for the Near Future

Providing more methods to interact with HipChat. The long-term plan is to cover all of the interactions possible with [HipChat API v2](https://www.hipchat.com/docs/apiv2).

## Usage

```ruby
@api = HipChat::Api.new(authorization_token)

# get list of users:
@users = @api.users

# find users by id, email, or mention_name:
finder = {
  mention_name: "SyedHumzaShah"
} # or {id: id} or {email: email}
user = @users.find(mention_name: "SyedHumzaShah")
# ^ alternate: HipChat::User.find(token, finder)

# create new users:
attributes = {
  email: "some_email@domain.com",
  name: "Syed Humza Shah",
  password: some_password
}
user = @users.create!(attributes) # or @users.create(attributes)
# ^ alternate: HipChat::User.create(token, attributes)

# update users:
user.name = "Syed Humza"
user.save! # or user.save

# delete a user:
user.destroy! # or user.destroy

# refresh users' list
@api.refresh_users
```
