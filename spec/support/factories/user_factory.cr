class UserFactory < Avram::Factory
  def initialize
    first_name "Ronald"
    last_name "McDonald"
    email "#{sequence("test-email")}@example.com"
    encrypted_password Authentic.generate_encrypted_password("password")
  end
end
