class AddIntroductionToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :title, :string
    add_column :posts, :text, :text
  end
end
