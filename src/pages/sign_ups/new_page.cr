class SignUps::NewPage < AuthLayout
  needs operation : SignUpUser

  def content
    div class: "flex items-center justify-center min-h-screen px-4" do
      div class: "w-full max-w-md" do
        div class: "bg-gray-800 rounded-lg shadow-lg border border-gray-700 overflow-hidden" do
          div class: "bg-indigo-700 p-6 border-b border-indigo-800" do
            h1 "Create Your Account", class: "text-2xl font-bold text-white text-center"
          end

          div class: "p-8" do
            render_sign_up_form(@operation)
          end
        end
      end
    end
  end

  private def render_sign_up_form(op)
    form_for SignUps::Create, class: "space-y-6" do
      sign_up_fields(op)

      div class: "pt-2" do
        submit "Sign Up", flow_id: "sign-up-button",
          class: "w-full bg-indigo-600 hover:bg-indigo-500 text-white font-medium py-3 px-4 rounded-md transition-colors duration-200"
      end

      div class: "mt-6 text-center border-t border-gray-700 pt-4" do
        link "Sign in instead", to: SignIns::New,
          class: "text-indigo-400 hover:text-indigo-300 transition-colors duration-200"
      end
    end
  end

  private def sign_up_fields(op)
    div class: "mb-6" do
      mount Shared::Field, attribute: op.email, label_text: "Email", &.email_input(autofocus: "true")
    end

    div class: "mb-6" do
      mount Shared::Field, attribute: op.first_name, label_text: "First Name", &.text_input
    end

    div class: "mb-6" do
      mount Shared::Field, attribute: op.last_name, label_text: "Last Name", &.text_input
    end

    div class: "mb-6" do
      mount Shared::Field, attribute: op.password, label_text: "Password", &.password_input
    end

    div class: "mb-6" do
      mount Shared::Field, attribute: op.password_confirmation, label_text: "Confirm Password", &.password_input
    end
  end
end
