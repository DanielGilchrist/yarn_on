class Comments::ErrorList < BaseComponent
  needs operation : SaveComment

  def render
    div id: "comment-errors", class: "text-red-400" do
      mount Shared::FieldErrors, operation.content
    end
  end
end
