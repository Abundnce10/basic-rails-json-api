class ApiKey < ActiveRecord::Base

  belongs_to :user
  belongs_to :role

  before_create :generate_token
  before_save :generate_expiration

  private

  def generate_token
    begin
      self.token = SecureRandom.hex.to_s
    end while self.class.exists?(token: token)
  end

  def generate_expiration
    self.expires_at = Time.now + 30.days
  end
  
end
