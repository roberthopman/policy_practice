This is a study object.

* Ruby version: 3.0.1
* System dependencies: See ./Gemfile & ./package.json
* Configuration: -
* Database creation: rails db:create
* Database initialization: -
* How to run the test suite: -
* Services (job queues, cache servers, search engines, etc.): -
* Deployment instructions: -
* To run locally: `bin/dev`

# policy_practice

Authentication / Users
- [x] create 3 users
- [x] have a current_user available
- [x] can quickly switch users 
- [x] can edit if user is current_user

Roles
- [x] user has_many roles
- [x] role belongs_to user, set user foreign_key
- [x] add role to user from interface (nested form)
- [x] remove role from user from interface (nested form)

Permissions / Policies:
- [x] user role maintainer, can delete entry
- [x] other user roles, can not delete entry
- [x] user role customer, can not see anything, except for being logged in

Structure:
- user
- user-role
- user-role-policy
- user
  - role: organisation, department, resource
  - policy: general, resource

Further research:
- rbac, abac
- https://stackoverflow.com/a/60110148
- https://actionpolicy.evilmartians.io/#/rails
- https://bizarre-authorization.talks.makandra.com/
- https://github.com/makandra/consul (user has power to ... )
- https://3.basecamp-help.com/article/75-permissions
- https://github.com/RolifyCommunity/rolify