def stub_omniauth(options={})
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
    provider: 'google_oauth2',
    uid: options[:google_id] || rand(100_000_0..999_999_9).to_s,
    info: {
      email: options[:email] || "ruby@formulafolios.com",
      first_name: options[:first_name] || "Ruby",
      last_name: options[:last_name] || "Rails"
    }
  )
end
