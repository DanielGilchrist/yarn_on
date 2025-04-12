class Users::Icon < BaseComponent
  enum Size
    Small
    Medium
    Large

    def class_css : String
      case self
      in .small?
        "w-8 h-8 text-sm mr-3"
      in .medium?
        "w-10 h-10 text-sm mr-3"
      in .large?
        "w-14 h-14 text-base mr-4"
      end
    end
  end

  needs user : User
  needs size : Size = Size::Medium

  def render
    div class: "bg-indigo-600 text-white #{size.class_css} rounded-full font-bold flex items-center justify-center flex-shrink-0" do
      text user.text_for_icon
    end
  end
end
