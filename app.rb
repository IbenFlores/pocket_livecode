require_relative 'post'
require_relative 'post_repository'
require_relative 'posts_controller'
require_relative 'router'



# PostRepository.new(File.join(__dir__, "posts.csv")).load_csv
csv_file_path = File.join(__dir__, "posts.csv")
post_repo = PostRepository.new(csv_file_path)
posts_controller = PostsController.new(post_repo)
router = Router.new(posts_controller)

router.run
