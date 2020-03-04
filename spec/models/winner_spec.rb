require 'rails_helper'

RSpec.describe Winner do
  describe '#validations' do
    subject(:winner_subject) { build(:winner) }

    it { expect(winner_subject).to validate_uniqueness_of(:survey_id) }
    it { expect(winner_subject).to validate_presence_of(:user_id) }
  end

  it 'sends WinnerEmail after creation' do
    # Act & Assert
    expect { create(:winner) }.to have_enqueued_job.on_queue('mailers')
  end
end
