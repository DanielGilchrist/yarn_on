class Posts::FormFields < BaseComponent
  needs operation : SavePost

  def render
    div class: "space-y-6" do
      mount Shared::Field, operation.title, &.text_input(placeholder: "Enter a compelling title", replace_class: "w-full bg-gray-700 border border-gray-600 rounded-md px-4 py-3 text-white placeholder-gray-400 focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500")

      div class: "mt-6" do
        mount Shared::Field, operation.content, &.textarea(placeholder: "Write your post here...", rows: "10", replace_class: "w-full bg-gray-700 border border-gray-600 rounded-md px-4 py-3 text-white placeholder-gray-400 focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500")
      end
    end
  end
end
