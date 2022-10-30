require 'open-uri'
require 'nokogiri'
require_relative 'posts_view'


class PostsController
  def initialize(post_repo)
    @post_repo = post_repo
    @posts_view = PostsView.new
  end

  def list
    @posts_view.display_posts(@post_repo.all)
  end

  def save_post
    base_url = "https://dev.to"
    path = @posts_view.ask_for_stuff("path")
    url = URI.open(base_url + path, "User-Agent" => "chrome").read
    post_html = Nokogiri::HTML(url)
    title = post_html.search(".crayons-article__header__meta > h1").text.strip
    author = post_html.search(".crayons-article__header__meta > div div a").text.strip
    content = post_html.search(".crayons-article__main").text.strip

    post = Post.new(path: path, title: title, content: content, author: author)
    @post_repo.add_post(post)
  end

  def read_post
    list
    index = @posts_view.ask_for_stuff("index").to_i - 1
    content = @post_repo.read_post(index)
    @posts_view.display_content(content)
  end

  def mark_as_read
    list
    index = @posts_view.ask_for_stuff("index").to_i - 1
    @post_repo.mark_as_read(index)
  end
end
