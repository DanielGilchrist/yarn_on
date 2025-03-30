abstract class MainLayout
  include Lucky::HTMLPage

  needs current_user : User
  abstract def content
  abstract def page_title

  def page_title
    "YarnOn"
  end

  def render
    html_doctype
    html lang: "en" do
      mount Shared::LayoutHead, page_title: page_title
      body class: "bg-gray-100 min-h-screen" do
        render_nav

        div class: "container mx-auto p-4" do
          mount Shared::FlashMessages, context.flash

          div class: "bg-white p-6 rounded shadow mt-4" do
            content
          end
        end
      end
    end
  end

  private def render_nav
    nav class: "bg-indigo-600 text-white p-4 shadow" do
      div class: "container mx-auto flex items-center justify-between" do
        link page_title, to: Home::Index, class: "text-xl font-bold"

        div class: "flex items-center gap-4" do
          link "Home", to: Home::Index, class: "hover:text-indigo-200"
          link "Profile", to: Me::Show, class: "hover:text-indigo-200"

          div class: "ml-4 pl-4 border-l border-indigo-500 flex items-center" do
            span current_user.email, class: "text-indigo-200 mr-2"
            link "Sign out", to: SignIns::Delete, flow_id: "sign-out-button",
              class: "bg-indigo-700 hover:bg-indigo-800 px-3 py-1 rounded"
          end
        end
      end
    end
  end
end

