class User < ApplicationRecord
  devise :database_authenticatable, :trackable, :omniauthable, omniauth_providers: [:google_oauth2]

  after_create :initialize_role
  validate :ffi_email_address?

  # Waits until user logs in with a valid FFI email address before setting role
  def initialize_role
    update(role: "employee")
  end

  def ffi_email_address?
    has_ffi_email = email.split('@')[1] == 'formulafolios.com'
    errors.add(:email, "Please log in with an FFI email address.") unless has_ffi_email
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
