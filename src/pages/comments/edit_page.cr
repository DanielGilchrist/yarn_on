class Comments::EditPage < MainLayout
  needs operation : SaveComment
  needs comment : Comment
  quick_def page_title, "Edit Comment with id: #{comment.id}"

  def content
    link "Back to all Comments", to: Comments::Index
    h1 "Edit Comment with id: #{comment.id}"
    render_comment_form(operation)
  end

  def render_comment_form(op)
    form_for Comments::Update.with(comment.id) do
      # Edit fields in src/components/comments/form_fields.cr
      mount Comments::FormFields, op

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
