class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, presence: true, uniqueness: true

  def self.random_code
    while true 
      short_url = SecureRandom.urlsafe_base64

      return short_url if self.exists?(short_url: short_url)
    end
  end
end