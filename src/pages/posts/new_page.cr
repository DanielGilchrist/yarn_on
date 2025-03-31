class Posts::NewPage < MainLayout
  needs operation : SavePost
  quick_def page_title, "New Post"

  def content
    div class: "max-w-3xl mx-auto py-8 px-4" do
      div class: "mb-8" do
        h1 "Create New Yarn", class: "text-3xl font-bold text-gray-100 mb-2"
        para "Share your thoughts with the community", class: "text-gray-300"
      end

      div class: "bg-gray-800 rounded-lg shadow-lg border border-gray-700 p-6" do
        render_post_form(operation)
      end
    end
  end

  def render_post_form(op)
    form_for Posts::Create, class: "space-y-6" do
      div class: "space-y-4" do
        mount Posts::FormFields, op
      end

      div class: "pt-4" do
        submit "Publish Post", data_disable_with: "Publishing...",
          class: "w-full sm:w-auto px-6 py-3 bg-indigo-600 hover:bg-indigo-500 text-white font-medium rounded-md transition-colors duration-200"
      end
    end
  end
end
