class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.integer :topic_id, null: false
      t.integer :url_id, null: false
    end

    add_index :taggings, %i(topic_id url_id), unique: true
    add_index :taggings, :url_id
  end
end
