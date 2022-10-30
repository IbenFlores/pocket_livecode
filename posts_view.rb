class PostsView
  def display_posts(posts)
    posts.each_with_index do |post, index|
      read = post.read? ? '[X]' : '[ ]'
      puts "#{read} #{index + 1} - #{post.title} by #{post.author}"
    end
  end

  def ask_for_stuff(stuff)
    puts "what's the #{stuff}"
    print ">"
    gets.chomp
  end

  def display_content(content)
    puts "post content:"
    puts content
  end
end
