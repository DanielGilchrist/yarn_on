class Comments::NewPage < MainLayout
  needs operation : SaveComment
  quick_def page_title, "New Comment"

  def content
    h1 "New Comment"
    render_comment_form(operation)
  end

  def render_comment_form(op)
    form_for Comments::Create do
      # Edit fields in src/components/comments/form_fields.cr
      mount Comments::FormFields, op

      submit "Save", data_disable_with: "Saving..."
    end
  end
end
