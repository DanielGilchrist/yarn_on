class Posts::ShowPage < MainLayout
  needs post : Post
  quick_def page_title, post.title.to_s

  def content
    div class: "max-w-3xl mx-auto py-8 px-4" do
      div class: "mb-6 flex justify-between items-center" do
        link to: Posts::Index, class: "flex items-center text-indigo-400 hover:text-indigo-300 transition-colors duration-200" do
          span "← Back to all posts"
        end
      end

      div class: "mb-8" do
        h1 post.title.to_s, class: "text-3xl font-bold text-gray-100 mb-4"

        div class: "flex items-center mb-6" do
          mount Users::Icon, user: post.author

          div class: "text-gray-300" do
            div class: "font-medium" do
              text post.author.full_name
            end
            div class: "text-sm text-gray-400" do
              text "Posted on #{post.created_at.try &.to_s("%B %d, %Y")}"
            end
          end
        end

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

      render_comments
    end
  end

  private def render_comments
    div class: "mt-12 bg-gray-800 rounded-lg shadow-md p-6 border border-gray-700" do
      h3 "Comments", class: "text-xl font-semibold text-gray-100 mb-4"

      div id: "comments-list", hx_get: Posts::Comments::List.with(post.id).path, hx_trigger: "load" do
        div class: "text-gray-400 italic" do
          para "Loading comments..."
        end
      end

      div class: "mt-6 pt-6 border-t border-gray-700" do
        form id: "comment-form",
          hx_post: Posts::Comments::Create.with(post.id).path,
          hx_target: "#comments-list",
          hx_swap: "outerHTML",
          hx_on__after_request: "if(event.detail.successful) { this.reset(); }",
          hx_swap_oob: "true" do
          div class: "mb-4" do
            textarea name: "comment:content",
              placeholder: "Share your thoughts...",
              class: "w-full p-3 bg-gray-700 text-gray-100 rounded border border-gray-600 focus:border-blue-500 focus:outline-none"
          end
          div class: "flex justify-end" do
            button type: "submit", class: "px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 transition" do
              text "Post Comment"
            end
          end
        end
      end
    end
  end
end
