class CommentQuery < Comment::BaseQuery
  def for_list(post : Post)
    post_id(post.id).created_at.asc_order.preload_author
  end
end
