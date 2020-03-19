require "rails_helper"

RSpec.describe Winner, type: :mailer do

  describe "#winner_email" do
    let(:winner) { create(:winner) }
    let(:mail) { WinnerMailer.winner_email(winner.id, winner.survey.id) }

    it 'renders the body' do
      expect(mail.body.encoded).to match("To see all past winners")
    end

    it 'renders the headers' do
      expect(mail.subject).to match("New MVP")
      expect(mail.to).to include(winner.user.email)
    end
  end
end
