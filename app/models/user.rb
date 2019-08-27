class User < ApplicationRecord
  OFFICES = ['Grand Rapids', 'Costa Mesa', 'Other/Remote'].freeze
  ROLES = ['employee', 'admin'].freeze

  devise :database_authenticatable, :trackable, :omniauthable, omniauth_providers: [:google_oauth2]
  after_create :initialize_user
  validate :ffi_email_address?

  scope :from_office, ->(office) { where(office: office) }

  # Waits until user logs in with a valid FFI email address before setting default attributes,
  # unless they're already set
  def initialize_user
    update(role: "employee") unless role
    update(office: "Grand Rapids") unless office
  end

  def ffi_email_address?
    has_ffi_email = email.split('@')[1] == 'formulafolios.com'
    errors.add(:email, "Please log in with an FFI email address.") unless has_ffi_email
  end

  def admin?
    role == "admin"
  end

  def employee?
    role == "employee"
  end

  def full_name
    [first_name, last_name].join(" ")
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

  # Utilized in development only
  def self.switch_user_roles
    # Users are created in db/seeds.rb
    User.all
  end

  def voted?(survey)
    nominations.find_by(survey: survey).present?
  end
end
