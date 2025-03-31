class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable

  table do
    column email : String
    column encrypted_password : String
  end

  def emailable : Carbon::Address
    Carbon::Address.new(email)
  end

  def text_for_icon : String
    email[0].to_s.upcase
  end
end
