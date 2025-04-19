class Shared::LayoutHead < BaseComponent
  needs page_title : String

  def render
    head do
      utf8_charset
      title page_title

      vite_entry_tags "main.js", defer: "true"
      css_link href: "https://fonts.googleapis.com/icon?family=Material+Icons"

      csrf_meta_tags
      responsive_meta_tag

      if LuckyEnv.development?
        live_reload_connect_tag

        # This is required to avoid FOUC (flash of unstyled content) in development
        # this style is overridden once CSS is loaded
        raw(
          <<-CSS
            <style>
              html {
                display: none;
              }
            </style>
          CSS
        )
      end
    end
  end
end
