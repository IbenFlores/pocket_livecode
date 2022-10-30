class Post
  attr_reader :path, :title, :content, :author

  def initialize(attr = {})
    @path = attr[:path] # /franklin030601/dynamic-forms-with-formik-and-react-js-3no1
    @title = attr[:title]
    @content = attr[:content]
    @author = attr[:author]
    @read = attr[:read] == "true" || false
  end

  def read?
    @read
  end

  def read!
    @read = true
  end
end
