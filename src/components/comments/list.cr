class Comments::List < BaseComponent
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
    div class: "mb-4 p-4 bg-gray-700 rounded-lg" do
      div class: "flex justify-between items-start" do
        div class: "font-medium text-gray-300" do
          text comment.author_name
        end

        div class: "text-xs text-gray-500" do
          text comment.created_at.to_s("%b %d, %Y")
        end
      end

      div class: "mt-2 text-gray-300" do
        para comment.content
      end
    end
  end
end
