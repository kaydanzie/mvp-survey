class Winner < ApplicationRecord
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :survey
end
