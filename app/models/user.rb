class User < ApplicationRecord
	before_create :create_remember_digest
	has_secure_password

	def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_digest
      self.remember_digest = User.digest(User.new_remember_token)
    end
end