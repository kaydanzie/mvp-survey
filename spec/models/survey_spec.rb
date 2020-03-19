require 'rails_helper'

RSpec.describe Survey do
  describe '#validations' do
    let(:survey_subject) { Survey.new }

    it { expect(survey_subject).to validate_uniqueness_of(:name) }
    it { expect(survey_subject).to validate_presence_of(:name) }
  end

  it 'sends nominate_email after creation' do
    # Act & Assert
    expect { create(:survey) }.to have_enqueued_job.on_queue('mailers')
  end
end
