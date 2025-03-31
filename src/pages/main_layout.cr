abstract class MainLayout
  include Lucky::HTMLPage

  needs current_user : User
  abstract def content

  def page_title
    "YarnOn"
  end

  def render
    html_doctype
    html lang: "en" do
      mount Shared::LayoutHead, page_title: page_title

      body class: "bg-gray-900 min-h-screen text-gray-100" do
        render_nav
        div class: "container mx-auto py-8 px-4 sm:px-6" do
          mount Shared::FlashMessages, context.flash

          div class: "rounded-lg overflow-hidden" do
            content
          end
        end
      end
    end
  end

  private def render_markdown(text : String)
    div class: "markdown-content" do
      raw Markd.to_html(text, Markd::Options.new(smart: true, safe: true))
    end
  end

  private def render_nav_item(text : String, action : BrowserAction.class)
    link text, to: action, class: "text-indigo-100 hover:text-white transition-colors duration-200"
  end

  private def render_nav
    nav class: "bg-indigo-800 text-white shadow-md" do
      div class: "container mx-auto py-4 px-4 sm:px-6" do
        div class: "flex items-center justify-between" do
          link page_title, to: Home::Index, class: "text-2xl font-bold text-white hover:text-white"
          div class: "flex items-center space-x-6" do
            render_nav_item("Posts", Posts::Index)
            render_nav_item("Profile", Me::Show)
            div class: "ml-6 pl-6 border-l border-indigo-500 flex items-center" do
              span current_user.email, class: "text-indigo-200 mr-3 hidden sm:inline"
              link "Sign out", to: SignIns::Delete, flow_id: "sign-out-button",
                class: "bg-indigo-900 hover:bg-indigo-700 px-4 py-2 rounded-md text-sm transition-colors duration-200"
            end
          end
        end
      end
    end
  end
end
