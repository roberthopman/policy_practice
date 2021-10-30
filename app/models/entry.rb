class Entry < ApplicationRecord
  validates :title, presence: true
  default_scope { order(created_at: :asc) }
end
