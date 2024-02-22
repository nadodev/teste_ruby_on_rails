# spec/features/posts_spec.rb

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'User sees posts and news successfully' do
    # Implemente a lógica para criar posts ou use FactoryGirl ou FactoryBot
    post = create(:post, title: 'Test Post')

    # Simula uma chamada bem-sucedida à API de notícias
    allow(NewsApiService).to receive(:top_headlines).and_return(
      double('response', body: { 'articles' => [{ 'title' => 'News Article 1' }] }.to_json)
    )

    visit posts_path

    expect(page).to have_content('Test Post')
    expect(page).to have_content('News Article 1')
  end

  scenario 'User sees error message when API call fails' do
    # Implemente a lógica para criar posts ou use FactoryGirl ou FactoryBot
    create(:post, title: 'Test Post')

    # Simula uma chamada falha à API de notícias
    allow(NewsApiService).to receive(:top_headlines).and_raise(StandardError, 'API error message')

    visit posts_path

    expect(page).to have_content('Test Post')
    expect(page).to have_content('Erro ao obter notícias: API error message')
  end
  scenario 'User sees posts and news successfully' do
    # Substitua :author por qualquer outra factory de autor que você possa ter
    author = create(:author)
    post = create(:post, title: 'Test Post', author: author)
 
  end
end
