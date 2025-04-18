# This component is used to make it easier to render the same fields styles
# throughout your app.
#
# Extensive documentation at: https://luckyframework.org/guides/frontend/html-forms#shared-components
#
# ## Basic usage:
#
#    # Renders a text input by default and will guess the label name "Name"
#    mount Shared::Field, op.name
#    # Call any of the input methods on the block
#    mount Shared::Field, op.email, &.email_input
#    # Add other HTML attributes
#    mount Shared::Field, op.email, &.email_input(autofocus: "true")
#    # Pass an explicit label name
#    mount Shared::Field, attribute: op.username, label_text: "Your username"
#
# ## Customization
#
# You can customize this component so that fields render like you expect.
# For example, you might wrap it in a div with a "field-wrapper" class.
#
#    div class: "field-wrapper"
#      label_for field
#      yield field
#      mount Shared::FieldErrors, field
#    end
#
# You may also want to have more components if your fields look
# different in different parts of your app, e.g. `CompactField` or
# `InlineTextField`
class Shared::Field(T) < BaseComponent
  # Raises a helpful error if component receives an unpermitted attribute
  include Lucky::CatchUnpermittedAttribute

  needs attribute : Avram::PermittedAttribute(T)
  needs label_text : String?

  def render(&)
    div class: "mb-4" do
      label_for attribute, class: "block text-gray-300 font-medium mb-2" do
        text label_text || Wordsmith::Inflector.humanize(attribute.name.to_s)
      end

      # You can add more default options here. For example:
      #
      #    tag_defaults field: attribute, class: "input"
      #
      # Will add the class "input" to the generated HTML.
      tag_defaults(
        class: "w-full bg-gray-700 border border-gray-600 rounded-md px-4 py-3 text-white placeholder-gray-400 focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500",
        field: attribute
      ) do |tag_builder|
        yield tag_builder
      end

      mount Shared::FieldErrors, attribute
    end
  end

  # Use a text_input by default
  def render
    render &.text_input
  end
end
