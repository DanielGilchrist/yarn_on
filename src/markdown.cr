module Markdown
  private def render_markdown(text : String)
    div class: "markdown-content" do
      raw Markd.to_html(text, Markd::Options.new(smart: true, safe: true))
    end
  end
end
