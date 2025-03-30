class Posts::EditPage < MainLayout
  needs operation : SavePost
  needs post : Post
  quick_def page_title, "Edit Post"

  def content
    div class: "max-w-3xl mx-auto py-8 px-4" do
      div class: "mb-2" do
        link to: Posts::Index, class: "flex items-center text-indigo-400 hover:text-indigo-300 transition-colors duration-200 mb-6" do
          span "← Back to all posts"
        end
      end

      div class: "mb-8" do
        h1 "Edit Your Post", class: "text-3xl font-bold text-gray-100 mb-2"
        para "Make changes to your yarn", class: "text-gray-300"
      end

      div class: "bg-gray-800 rounded-lg shadow-lg border border-gray-700 p-6" do
        render_post_form(operation)
      end
    end
  end

  def render_post_form(op)
    form_for Posts::Update.with(post.id), class: "space-y-6" do
      div class: "space-y-4" do
        mount Posts::FormFields, op
      end

      div class: "pt-4 flex items-center justify-between" do
        link "Cancel", to: Posts::Show.with(post),
          class: "px-6 py-3 bg-gray-700 hover:bg-gray-600 text-white font-medium rounded-md transition-colors duration-200"

        submit "Save Changes", data_disable_with: "Saving...",
          class: "px-6 py-3 bg-indigo-600 hover:bg-indigo-500 text-white font-medium rounded-md transition-colors duration-200"
      end
    end
  end
end
