class Entry < ApplicationRecord
  belongs_to :user
  default_scope { order(created_at: :asc) }
  validates :title, presence: true
end
