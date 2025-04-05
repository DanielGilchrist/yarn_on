class Shared::LayoutHead < BaseComponent
  needs page_title : String

  def render
    head do
      utf8_charset
      title page_title

      vite_entry_tags "main.js", defer: "true"

      csrf_meta_tags
      responsive_meta_tag

      live_reload_connect_tag if LuckyEnv.development?
    end
  end
end
