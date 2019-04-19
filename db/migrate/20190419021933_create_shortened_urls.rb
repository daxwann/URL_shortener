class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.string :short_url,
        null: false,
        unique: true
      
      t.string :long_url,
        null: false,
      
      t.timestamps
    end
  end
end
