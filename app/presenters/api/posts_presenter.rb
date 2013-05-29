class Api::PostsPresenter

  attr_reader :posts

  def initialize(posts)
    @posts = posts
  end

  def as_json(options = {})
    {
      :posts => posts_array
    }
  end

  def posts_array
    posts.map do |post|
      Api::PostPresenter.new(post).post_hash
    end
  end
end
