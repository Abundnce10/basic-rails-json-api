class User < ActiveRecord::Base
=begin
	attr_accessor :password
	attr_accessible :username, :email, :password
=end
	validates_presence_of :password, on: :create
	validates :email, uniqueness: {case_sensitive: false}, presence: true
	validates :username, uniqueness: {case_sensitive: false}, if: ->(user) { user.username.present? }



	# users.password_hash in the database is a :string
  include BCrypt

  has_one :api_key, dependent: :destroy

  after_create :create_api_key

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  private

  def create_api_key
    ApiKey.create :user => self
  end

end
