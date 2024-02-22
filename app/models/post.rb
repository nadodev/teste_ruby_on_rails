class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 100 }
    validates :category, presence: true
    belongs_to :author

    default_scope -> { order(created_at: :desc) }
  end