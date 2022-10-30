require "csv"

class PostRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @posts = []
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @posts
  end

  def add_post(post)
    @posts << post
    save_csv
  end

  def read_post(index)
    post = @posts[index]
    post.content
  end

  def mark_as_read(index)
    @posts[index].read!
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      post = Post.new({
        path: row[0],
        title: row[1],
        content: row[2],
        author: row[3],
        read: row[4]
      })
      @posts << post
    end
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      @posts.each do |post|
        csv << [post.path, post.title, post.content, post.author, post.read?]
      end

    end
  end
end

