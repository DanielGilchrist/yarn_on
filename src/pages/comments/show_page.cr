class Comments::ShowPage < MainLayout
  needs comment : Comment
  quick_def page_title, "Comment with id: #{comment.id}"

  def content
    link "Back to all Comments", to: Comments::Index
    h1 "Comment with id: #{comment.id}"
    render_actions
    render_comment_fields
  end

  def render_actions
    section do
      link "Edit", to: Comments::Edit.with(comment.id)
      text " | "
      link "Delete",
        to: Comments::Delete.with(comment.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_comment_fields
    ul do
      li do
        text "content: "
        strong comment.content.to_s
      end
    end
  end
end
