class Survey < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :nominations, dependent: :destroy
  has_one :winner, dependent: :destroy

  # Groups nominees together, sorts by most nominations to least
  def grouped_nominations
    nominations.group_by(&:nominee_id).sort_by { |_, v| v.count }.reverse
  end

  def uniq_nominees
    user_ids = nominations.pluck(:nominee_id).uniq
    User.where(id: user_ids)
  end
end
