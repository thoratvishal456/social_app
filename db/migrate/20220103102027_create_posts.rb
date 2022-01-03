# frozen_string_literal: true

# User can create posts
class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :content, null: false
      t.references :user, index: true
      t.string :attachment

      t.timestamps
    end
  end
end
