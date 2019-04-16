class User < ApplicationRecord
  devise :database_authenticatable, :trackable, :omniauthable, omniauth_providers: [:google_oauth2]

  after_create :initialize_role

  def initialize_role
    update(role: "employee") if ffi_email?
  end

  def ffi_email?
    email.split('@')[1] == 'formulafolios.com'
  end

  def self.from_omniauth(auth)
    find_by(provider: auth.provider, uid: auth.uid) || create_from_auth(auth)
  end

  def self.create_from_auth(auth)
    create(
      provider: auth.provider,
      uid: auth.uid,
      first_name: auth.info.first_name,
      last_name: auth.info.last_name,
      email: auth.info.email
    )
  end
end
