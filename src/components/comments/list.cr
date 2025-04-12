class Comments::List < BaseComponent
  needs current_user : User
  needs comments : CommentQuery

  def render
    div id: "comments-list" do
      if comments.empty?
        div class: "text-gray-400 italic" do
          para "No comments yet. Be the first to share your thoughts!"
        end
      else
        comments.each do |comment|
          render_comment(comment)
        end
      end
    end
  end

  private def render_comment(comment)
    div id: "comment-#{comment.id}", class: "mb-4 p-4 bg-gray-700 rounded-lg" do
      div class: "flex justify-between items-start" do
        div class: "font-medium text-gray-300" do
          text comment.author_name
        end

        div class: "flex items-center" do
          div class: "text-xs text-gray-500 mr-2" do
            text comment.created_at.to_s("%b %d, %Y")
          end

          if current_user.try(&.id) == comment.author_id
            button type: "button",
              class: "px-2 py-1 bg-red-700 hover:bg-red-600 text-white font-medium rounded-md transition-colors duration-200 text-xs flex items-center",
              hx_delete: Posts::Comments::Delete.with(comment.post_id, comment.id).path,
              hx_swap: "outerHTML",
              hx_target: "#comment-#{comment.id}",
              hx_confirm: "Are you sure you want to delete this comment?" do
                span class: "material-icons text-sm" do
                  text "delete"
                end
              end
          end
        end
      end

      div class: "mt-2 text-gray-300" do
        para comment.content
      end
    end
  end
end
