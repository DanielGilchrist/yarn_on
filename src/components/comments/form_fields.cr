class Comments::FormFields < BaseComponent
  needs operation : SaveComment

  def render
    mount Shared::Field, operation.content, &.text_input(autofocus: "true")
  end
end
