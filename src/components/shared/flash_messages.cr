class Shared::FlashMessages < BaseComponent
  needs flash : Lucky::FlashStore

  enum FlashType
    Success
    Failure
    Info
  end

  def render
    div class: "max-w-5xl mx-auto px-4 pt-4" do
      flash.each do |flash_type_string, flash_message|
        flash_type = FlashType.parse?(flash_type_string) || raise("#{flash_type_string} not handled!")
        render_flash(flash_type, flash_message)
      end
    end
  end

  private def render_flash(flash_type : FlashType, flash_message : String)
    div class: "#{flash_background_class(flash_type)} #{flash_text_class(flash_type)} px-4 py-3 rounded-md shadow-md mb-4 border #{flash_border_class(flash_type)}",
        role: "alert",
        flow_id: "flash" do
      div class: "flex items-center" do
        span flash_icon(flash_type), class: "mr-3"
        span flash_message, class: "font-medium"
      end
    end
  end

  private def flash_background_class(flash_type : FlashType) : String
    case flash_type
    in .success?
      "bg-green-900/30"
    in .failure?
      "bg-red-900/30"
    in .info?
      "bg-blue-900/30"
    end
  end

  private def flash_text_class(flash_type : FlashType) : String
    case flash_type
    in .success?
      "text-green-300"
    in .failure?
      "text-red-300"
    in .info?
      "text-blue-300"
    end
  end

  private def flash_border_class(flash_type : FlashType) : String
    case flash_type
    in .success?
      "border-green-700"
    in .failure?
      "border-red-700"
    in .info?
      "border-blue-700"
    end
  end

  private def flash_icon(flash_type : FlashType) : String
    case flash_type
    in .success?
      "✓"
    in .failure?
      "✗"
    in .info?
      "ℹ"
    end
  end
end
