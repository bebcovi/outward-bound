require "active_attr"

class Session
  include ActiveAttr::Model

  attribute :username,    type: String
  attribute :password,    type: String
  attribute :remember_me, type: Integer

  attr_reader :user

  def remember_me?
    remember_me == 1
  end

  def authenticate
    @user = User.find_by_username(username).try(:authenticate, password)
  end
end
