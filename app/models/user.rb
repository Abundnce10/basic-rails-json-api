class User < ActiveRecord::Base

	attr_accessor :password

	has_one :api_key, dependent: :destroy

	validates_presence_of :password, on: :create
	validates :email, uniqueness: {case_sensitive: false}, presence: true
	validates :username, uniqueness: {case_sensitive: false}, if: ->(user) { user.username.present? }

	before_save :encrypt_password
	after_create :create_api_key

	def encrypt_password
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end

  private

  def create_api_key
    ApiKey.create :user => self
  end

end
