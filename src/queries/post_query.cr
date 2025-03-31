class PostQuery < Post::BaseQuery
  def in_descending_order
    created_at.desc_order
  end
end
