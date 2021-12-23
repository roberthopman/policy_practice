class Role < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, presence: true
  USER_ROLES = ["maintainer", "developer", "customer"]
end
