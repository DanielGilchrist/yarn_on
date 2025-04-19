class Comments::List < BaseComponent
  needs current_user : User
  needs post : Post
  needs comments : CommentQuery
  needs newest_comment_id : Int64? = nil

  def render
    div id: "comments-list" do
      if comments.empty?
        div class: "text-gray-400 italic py-4" do
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
    div id: "comment-#{comment.id}", class: comment_classes(comment) do
      div class: "flex justify-between items-center p-3 bg-gray-800" do
        div class: "flex items-center" do
          mount_instance Users::Icon.new(user: comment.author, size: :small)

          div do
            div class: "font-medium text-gray-200 flex items-center" do
              text comment.author_name
              if comment.author_id == post.author_id
                span class: "ml-2 px-2 py-0.5 text-xs bg-indigo-600 text-white rounded-full" do
                  text "Author"
                end
              end
            end

            div class: "text-xs text-gray-400 mt-0.5" do
              text comment.pretty_created_at
            end
          end
        end

        if current_user.id == comment.author_id
          button type: "button",
            class: "p-1.5 rounded-md hover:bg-gray-700 text-gray-400 hover:text-red-400 transition-colors duration-200",
            title: "Delete comment",
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

      div class: "p-4 bg-gray-750 border-t border-gray-700" do
        div class: "prose prose-sm prose-invert max-w-none" do
          render_markdown(comment.content)
        end
      end
    end
  end

  private def comment_classes(comment : Comment) : String
    comment_classes = "mb-6 rounded-lg overflow-hidden transition-all duration-200 border border-gray-700 hover:border-gray-600"
    comment_classes += " comment-new" if newest_comment_id == comment.id

    comment_classes
  end
end
