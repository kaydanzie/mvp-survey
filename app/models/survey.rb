class Survey < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :nominations, dependent: :destroy
end
