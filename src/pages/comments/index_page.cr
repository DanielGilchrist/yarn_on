class Comments::IndexPage < MainLayout
  needs comments : CommentQuery
  quick_def page_title, "All Comments"

  def content
    h1 "All Comments"
    link "New Comment", to: Comments::New
    render_comments
  end

  def render_comments
    ul do
      comments.each do |comment|
        li do
          link comment.content, to: Comments::Show.with(comment)
        end
      end
    end
  end
end
