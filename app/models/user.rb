class User < ActiveRecord::Base
  has_secure_password
  has_many :likes
  has_many :liked_comedians, through: :likes, source: 'comedian'


  def self.create_anonymous!
    User.create(password: SecureRandom.uuid)
  end

  def anonymous?
    email.nil? && persisted?
  end

end
