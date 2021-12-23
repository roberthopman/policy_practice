class Role < ApplicationRecord
  belongs_to :user, optional: true

  USER_ROLES = ["maintainer", "developer", "customer"]
end
