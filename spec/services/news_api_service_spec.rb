require 'rails_helper'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

# Descreve a classe e especifica que os testes são do tipo serviço para o RSpec.
RSpec.describe NewsApiService, type: :service do

  describe '.top_headlines' do
    # Teste para verificar se a API retorna com sucesso.
    it 'returns top headlines' do

      # Simula uma resposta JSON válida da API quando é feita uma solicitação de top headlines.
      stub_request(:get, /newsapi\.org\/v2\/top-headlines/)
        .to_return(status: 200, body: '{"articles": [{"title": "Article 1"}]}', headers: { 'Content-Type' => 'application/json' })

      # Chama o método que interage com a API.
      response = NewsApiService.top_headlines

      # Verifica se a resposta é uma instância de HTTParty::Response e se contém os dados esperados.
      expect(response).to be_a(HTTParty::Response)
      expect(response['articles']).to be_an(Array)
      expect(response['articles'].first['title']).to eq('Article 1')
    end
  end

  # Contexto para testar o tratamento de erro quando a API retorna um código de status 500 (Internal Server Error).
  context 'when the API returns an error' do

    # Teste para verificar se a classe trata corretamente os erros da API.
    it 'handles API errors' do
        
      # Configura o WebMock para simular uma falha na API quando é feita uma solicitação de top headlines.
      stub_request(:get, /newsapi\.org\/v2\/top-headlines/)
        .to_return(status: 500, body: 'Internal Server Error', headers: {})

      # Chama o método que interage com a API.
      response = NewsApiService.top_headlines

      # Verifica se o método trata corretamente a falha da API, conferindo o código de status e o corpo da resposta.
      expect(response.code).to eq(500)
      expect(response.parsed_response).to eq('Internal Server Error')
    end
  end
end