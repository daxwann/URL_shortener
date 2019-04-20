require_relative 'shortened_url'

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: :ShortenedUrl

  has_many :visits,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Visit
  
  has_many :visited_urls,
    through: :visits,
    source: :visited_url

  def shorten_url(long_url)
    return false if self.id.nil?
    short_url = ShortenedUrl.random_code
    shortened_url = ShortenedUrl.new(long_url: long_url, submitter_id: self.id, short_url: short_url)
    return shortened_url if shortened_url.save!
    false
  end
end