class AddFontesToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :fontes, :string
  end
end
