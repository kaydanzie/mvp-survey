require 'rails_helper'

RSpec.describe Winner do
  describe '#validations' do
    subject(:winner_subject) { build(:winner) }

    it { expect(winner_subject).to validate_uniqueness_of(:survey_id) }
    it { expect(winner_subject).to validate_presence_of(:user_id) }
  end

  it 'sends winner_email after creation' do
    # Act & Assert
    # creating a survey also queues an email, so we have to create the survey first
    survey = create(:survey)
    expect { create(:winner, survey: survey) }.to have_enqueued_job.on_queue('mailers')
  end
end
