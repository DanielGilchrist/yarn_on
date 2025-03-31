class Me::ShowPage < MainLayout
  def content
    div class: "p-6 md:p-8" do
      div class: "flex items-center mb-8" do
        div class: "bg-indigo-600 text-white p-4 rounded-full mr-4 text-xl font-bold" do
          text @current_user.text_for_icon
        end

        div do
          h1 "Your Profile", class: "text-2xl font-bold text-gray-100"
          para class: "text-gray-300" do
            text "Manage your YarnOn account"
          end
        end
      end

      div class: "bg-gray-800 p-6 rounded-lg border border-gray-700 mb-6" do
        div class: "mb-2 text-sm text-gray-300 uppercase tracking-wide font-semibold" do
          text "Account Details"
        end

        div class: "flex items-center justify-between py-3 border-b border-gray-700" do
          div class: "font-medium" do
            text "Email Address"
          end

          div class: "text-gray-300" do
            text @current_user.email
          end
        end

        div class: "flex items-center justify-between py-3" do
          div class: "font-medium" do
            text "Member Since"
          end

          div class: "text-gray-300" do
            text current_user.created_at.to_s("%B %d, %Y")
          end
        end
      end
    end
  end
end
