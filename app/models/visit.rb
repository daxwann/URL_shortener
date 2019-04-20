require_relative 'user'
require_relative 'shortened_url'

class Visit < ApplicationRecord
  validates :user_id, :url_id, presence: true

  belongs_to :visitor,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  
  belongs_to :visited_url,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :ShortenedUrl

  def self.record_visit!(user, shortened_url)
    return false if user.id.nil? || shortened_url.id.nil?
    visit = Visit.new(user_id: user.id, url_id: shortened_url.id)
    return true if visit.save!
    false
  end
end