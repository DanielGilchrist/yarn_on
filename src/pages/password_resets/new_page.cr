class PasswordResets::NewPage < AuthLayout
  needs operation : ResetPassword
  needs user_id : Int64

  def content
    div class: "flex items-center justify-center min-h-screen px-4" do
      div class: "w-full max-w-md" do
        div class: "bg-gray-800 rounded-lg shadow-lg border border-gray-700 overflow-hidden" do
          div class: "bg-indigo-700 p-6 border-b border-indigo-800" do
            h1 "Create New Password", class: "text-2xl font-bold text-white text-center"
          end

          div class: "p-8" do
            para "Please enter a new secure password for your account.", class: "text-gray-300 mb-6"

            render_password_reset_form(@operation)
          end
        end
      end
    end
  end

  private def render_password_reset_form(op)
    form_for PasswordResets::Create.with(@user_id), class: "space-y-6" do
      div class: "mb-6" do
        mount Shared::Field,
          operation: operation,
          attribute: op.password,
          label_text: "Password",
          &.password_input(autofocus: "true")
      end

      div class: "mb-6" do
        mount Shared::Field,
              operation: operation,
              attribute: op.password_confirmation,
              label_text: "Confirm Password",
              &.password_input
      end

      div class: "pt-2" do
        submit "Update Password", flow_id: "update-password-button",
          class: "w-full bg-indigo-600 hover:bg-indigo-500 text-white font-medium py-3 px-4 rounded-md transition-colors duration-200"
      end
    end
  end
end
