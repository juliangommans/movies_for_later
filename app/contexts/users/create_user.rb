class Users::CreateUser
  attr_reader :decorator

  def self.call(params)
    Users.CreateUser.new(params).call
  end

  def initialize(params)
    new_user = User.new
    @decorator = Users.UserDecorator.new(new_user, params)
  end


end