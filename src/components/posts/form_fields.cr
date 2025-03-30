class Posts::FormFields < BaseComponent
  needs operation : SavePost

  def render
    div class: "space-y-6" do
      mount Shared::Field, operation.title, &.text_input(placeholder: "Enter a compelling title")

      div class: "mt-6" do
        mount Shared::Field, operation.content, &.textarea(placeholder: "Write your post here...", rows: "10")
      end
    end
  end
end
