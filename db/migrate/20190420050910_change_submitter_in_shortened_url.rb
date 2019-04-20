class ChangeSubmitterInShortenedUrl < ActiveRecord::Migration[5.2]
  def change
    rename_column :shortened_urls, :submitter, :submitter_id
  end
end
