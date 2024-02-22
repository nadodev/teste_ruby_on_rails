FactoryBot.define do
    factory :post do
      title { 'Test Post' }
      content { 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce condimentum.' }
      category { 'politics' }  # Substitua pela categoria desejada
      association :author, factory: :author  # Substitua pela factory de autor, se aplicável
    end
  end