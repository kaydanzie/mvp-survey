require "rails_helper"

RSpec.describe Survey, type: :mailer do
  describe "#winner_email" do
    let(:survey) { create(:survey) }
    let!(:user) { create(:user) }
    let(:mail) { SurveyMailer.nominate_email(survey.id) }

    it 'renders the body' do
      expect(mail.body.encoded).to match("New Survey")
    end

    it 'renders the headers' do
      expect(mail.subject).to match("Time to nominate")
      expect(mail.to).to include(user.email)
    end
  end
end
