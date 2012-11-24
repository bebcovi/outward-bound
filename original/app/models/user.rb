class User < ActiveRecord::Base
  attr_accessible :username, :password
  has_secure_password

  def to_s
    username
  end

  def self.authenticate(attributes)
    find_by_username(attributes[:username]).try(:authenticate, attributes[:password])
  end
end
