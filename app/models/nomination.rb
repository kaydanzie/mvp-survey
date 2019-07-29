class Nomination < ApplicationRecord
  belongs_to :user
  belongs_to :survey

  validates :nominee_id, presence: { message: 'You must choose an employee to nominate' }
end
