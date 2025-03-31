class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable

  table do
    column first_name : String
    column last_name : String
    column email : String
    column encrypted_password : String
  end

  def emailable : Carbon::Address
    Carbon::Address.new(email)
  end

  def full_name : String
    "#{first_name} #{last_name}"
  end

  def text_for_icon : String
    "#{first_name[0]}#{last_name[0]}".upcase
  end
end
