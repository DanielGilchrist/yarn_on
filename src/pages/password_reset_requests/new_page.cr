class PasswordResetRequests::NewPage < AuthLayout
  needs operation : RequestPasswordReset

  def content
    div class: "flex items-center justify-center min-h-screen px-4" do
      div class: "w-full max-w-md" do
        div class: "bg-gray-800 rounded-lg shadow-lg border border-gray-700 overflow-hidden" do
          div class: "bg-indigo-700 p-6 border-b border-indigo-800" do
            h1 "Reset Your Password", class: "text-2xl font-bold text-white text-center"
          end

          div class: "p-8" do
            para "Enter your email address and we'll send you a link to reset your password.", class: "text-gray-300 mb-6"

            form_for PasswordResetRequests::Create, class: "space-y-6" do
              div class: "mb-6" do
                mount Shared::Field, attribute: operation.email, label_text: "Email", &.email_input(autofocus: "true")
              end

              div class: "pt-2" do
                submit "Reset Password",
                  flow_id: "request-password-reset-button",
                  class: "w-full bg-indigo-600 hover:bg-indigo-500 text-white font-medium py-3 px-4 rounded-md transition-colors duration-200"
              end
            end

            div class: "mt-6 text-center border-t border-gray-700 pt-4" do
              link "Back to sign in", to: SignIns::New,
                class: "text-indigo-400 hover:text-indigo-300 transition-colors duration-200"
            end
          end
        end
      end
    end
  end
end
