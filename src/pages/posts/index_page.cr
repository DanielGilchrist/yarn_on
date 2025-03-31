class Posts::IndexPage < MainLayout
  needs posts : PostQuery
  quick_def page_title, "Latest Yarns"

  def content
    div class: "max-w-5xl mx-auto py-8 px-4" do
      div class: "flex justify-between items-center mb-8" do
        div do
          h1 "Latest Yarns", class: "text-3xl font-bold text-gray-100 mb-2"
          para "Explore the latest stories and conversations", class: "text-gray-300"
        end

        link "Create New Post", to: Posts::New, class: "px-4 py-2 bg-indigo-500 hover:bg-indigo-400 text-white font-medium rounded-md transition-colors duration-200"
      end

      if posts.any?
        div class: "grid gap-6 md:grid-cols-2" do
          posts.each do |post|
            render_post_card(post)
          end
        end
      else
        render_empty_state
      end
    end
  end

  private def render_post_card(post)
    div class: "bg-gray-800 rounded-lg shadow-lg border border-gray-700 overflow-hidden hover:border-indigo-500 transition-all duration-200" do
      link to: Posts::Show.with(post), class: "block p-6" do
        div class: "text-sm text-gray-400 mb-2" do
          text post.created_at.try(&.to_s("%B %d, %Y")) || "Draft"
        end

        h2 post.title.to_s, class: "text-xl font-semibold text-white mb-3 hover:text-indigo-300 transition-colors duration-200"

        span "Read more →", class: "text-indigo-300 hover:text-indigo-200 text-sm font-medium inline-block mt-2"
      end
    end
  end

  private def render_empty_state
    div class: "bg-gray-800 rounded-lg shadow-lg border border-gray-700 p-8 text-center" do
      h3 "No posts yet", class: "text-xl font-semibold text-white mb-4"
      para "Be the first to create a yarn and start the conversation!", class: "text-gray-300 mb-6"
      link "Create Your First Post", to: Posts::New, class: "px-6 py-3 bg-indigo-500 hover:bg-indigo-400 text-white font-medium rounded-md transition-colors duration-200 inline-block"
    end
  end
end
