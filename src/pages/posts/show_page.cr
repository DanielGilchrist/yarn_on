class Posts::ShowPage < MainLayout
  needs post : Post
  quick_def page_title, post.title.to_s

  def content
    div class: "max-w-3xl mx-auto py-8 px-4" do
      div class: "mb-6 flex justify-between items-center" do
        link to: Posts::Index, class: "flex items-center text-indigo-400 hover:text-indigo-300 transition-colors duration-200" do
          span "← Back to all posts"
        end

        div class: "text-gray-400 text-sm" do
          text "Posted on #{post.created_at.try &.to_s("%B %d, %Y")}"
        end
      end

      div class: "mb-8" do
        h1 post.title.to_s, class: "text-3xl font-bold text-gray-100 mb-6"

        if current_user.id == post.author_id
          div class: "flex space-x-4" do
            link "Edit Post", to: Posts::Edit.with(post.id),
              class: "px-4 py-2 bg-indigo-600 hover:bg-indigo-500 text-white font-medium rounded-md transition-colors duration-200"

            link "Delete Post", to: Posts::Delete.with(post.id),
              class: "px-4 py-2 bg-red-700 hover:bg-red-600 text-white font-medium rounded-md transition-colors duration-200",
              data_confirm: "Are you sure you want to delete this post?"
          end
        end
      end

      article class: "bg-gray-800 rounded-lg shadow-md p-8 text-gray-200 leading-relaxed" do
        render_markdown(post.content)
      end

      div class: "mt-12 bg-gray-800 rounded-lg shadow-md p-6 border border-gray-700" do
        h3 "Comments", class: "text-xl font-semibold text-gray-100 mb-4"

        div class: "text-gray-400 italic" do
          para "No comments yet. Be the first to share your thoughts!"
        end

        div class: "mt-6 pt-6 border-t border-gray-700" do
          #link "Add a comment", to: "#",
          #  class: "px-4 py-2 bg-indigo-600 hover:bg-indigo-500 text-white font-medium rounded-md transition-colors duration-200 inline-block"
        end
      end
    end
  end
end
