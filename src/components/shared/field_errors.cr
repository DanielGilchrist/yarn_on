class Shared::FieldErrors(T) < BaseComponent
  needs attribute : Avram::PermittedAttribute(T)

  def render
    unless attribute.valid?
      div class: "text-red-400 text-sm mt-1 flex items-center" do
        span "!", class: "text-red-500 bg-red-900/50 rounded-full w-4 h-4 inline-flex items-center justify-center mr-1 text-xs font-bold"
        text "#{attribute.name} #{attribute.errors.first}"
      end
    end
  end
end
