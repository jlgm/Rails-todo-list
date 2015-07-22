class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |f|
      f.references :list, index: true, foreign_key: true
      f.references :user, index: true, foreign_key: true
      f.timestamps null: false
    end
  end
end
