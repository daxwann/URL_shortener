class AddSubmitterToShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    add_column :shortened_urls, :submitter, :integer, :null => false
  end
end
