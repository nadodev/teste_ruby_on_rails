class NewsApiService
  include HTTParty
  base_uri NEWS_API_CONFIG[:base_url]

  def self.top_headlines(country: 'us', category: 'general', page_size: 5)
    get('/top-headlines', query: { country: country, category: category, apiKey: NEWS_API_CONFIG[:api_key] })
  end

  # Adicione métodos conforme necessário para interagir com outras partes da API
end