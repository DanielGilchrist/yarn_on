class SignUpUser < User::SaveOperation
  include PasswordValidations

  param_key :user

  permit_columns first_name, last_name, email

  attribute password : String
  attribute password_confirmation : String

  before_save do
    validate_uniqueness_of email
    Authentic.copy_and_encrypt(password, to: encrypted_password) if password.valid?
  end
end
