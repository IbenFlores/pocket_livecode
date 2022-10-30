class Router
  def initialize(posts_controller)
    @posts_controller = posts_controller
    @running = true
  end


  def run
    while @running
      puts "1. List Posts"
      puts "2. Save post for later"
      puts "3. Read post"
      puts "4. Mark as read"
      puts "5. Exit"
      print ">"
      choice = gets.chomp
      perform_action(choice)
    end
  end

  def perform_action(choice)
    case choice
    when "1" then @posts_controller.list
    when "2" then @posts_controller.save_post
    when "3" then @posts_controller.read_post
    when "4" then @posts_controller.mark_as_read
    when "5" then stop!
    end
  end

  def stop!
    @running = false
  end
end
