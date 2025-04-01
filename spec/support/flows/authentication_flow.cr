class AuthenticationFlow < BaseFlow
  private getter email, first_name, last_name

  def initialize(@email : String, @first_name : String, @last_name : String)
  end

  def sign_up(password)
    visit SignUps::New
    fill_form SignUpUser,
      email: email,
      first_name: first_name,
      last_name: last_name,
      password: password,
      password_confirmation: password
    click "@sign-up-button"
  end

  def sign_out
    visit Me::Show
    sign_out_button.click
  end

  def sign_in(password)
    visit SignIns::New
    fill_form SignInUser,
      email: email,
      password: password
    click "@sign-in-button"
  end

  def should_be_signed_in
    current_page.should have_element("@sign-out-button")
  end

  def should_have_password_error
    flash_button.should have_text("Sign in failed")
  end

  private def flash_button
    el("@flash")
  end

  private def sign_out_button
    el("@sign-out-button")
  end

  # NOTE: this is a shim for readability
  private def current_page
    self
  end
end
