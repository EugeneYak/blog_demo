class PostHandler < ApplicationHandler

  attr_accessor :author_ip, :author_login, :content, :title, :post
  validates :author_ip, :author_login, :content, :title, presence: true

  def main
    return unless valid?
    build_post
    set_author
    post.save
  end

  private

  def build_post
    self.post = Post.new.tap do |post|
      post.author_ip = author_ip
      post.content = content
      post.title = title
    end
  end

  def serialize_resource
    PostSerializer.new(post)
  end

  def set_author
    self.post.author = User.find_or_initialize_by(login: author_login)
  end
end