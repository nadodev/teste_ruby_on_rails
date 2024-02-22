class UpdateNewsWorker
    include Sidekiq::Worker
  
    def perform(post_id)
      post = Post.find(post_id)
      NewsApiService.get_news(post.category)
      # Atualize as informações de notícias para a categoria associada ao post
    end
  end