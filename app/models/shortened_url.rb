class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, presence: true, uniqueness: true
  validates :submitter_id, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: :User

  def self.random_code
    while true 
      short_url = SecureRandom.urlsafe_base64

      return short_url unless self.exists?(short_url: short_url)
    end
  end
end