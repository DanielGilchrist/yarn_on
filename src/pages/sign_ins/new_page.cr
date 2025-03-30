class SignIns::NewPage < AuthLayout
  needs operation : SignInUser

  def content
    div class: "flex items-center justify-center min-h-screen px-4" do
      div class: "w-full max-w-md" do
        div class: "bg-gray-800 rounded-lg shadow-lg border border-gray-700 overflow-hidden" do
          div class: "bg-indigo-700 p-6 border-b border-indigo-800" do
            h1 "Sign In to YarnOn", class: "text-2xl font-bold text-white text-center"
          end

          div class: "p-8" do
            render_sign_in_form(@operation)
          end
        end
      end
    end
  end

  private def render_sign_in_form(op)
    form_for SignIns::Create, class: "space-y-6" do
      sign_in_fields(op)

      div class: "pt-2" do
        submit "Sign In", flow_id: "sign-in-button",
          class: "w-full bg-indigo-600 hover:bg-indigo-500 text-white font-medium py-3 px-4 rounded-md transition-colors duration-200"
      end

      div class: "mt-6 flex justify-between text-sm border-t border-gray-700 pt-4" do
        link "Reset password", to: PasswordResetRequests::New,
          class: "text-indigo-400 hover:text-indigo-300 transition-colors duration-200"

        link "Sign up for an account", to: SignUps::New,
          class: "text-indigo-400 hover:text-indigo-300 transition-colors duration-200"
      end
    end
  end

  private def sign_in_fields(op)
    div do
      mount Shared::Field, attribute: op.email, label_text: "Email", &.email_input(autofocus: "true")

      mount Shared::Field, attribute: op.password, label_text: "Password", &.password_input
    end
  end
end
