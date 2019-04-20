class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, presence: true, uniqueness: true
  validates :submitter_id, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Visit

  has_many :visitors,
    through: :visits,
    source: :visitor

  def self.random_code
    while true 
      short_url = SecureRandom.urlsafe_base64

      return short_url unless self.exists?(short_url: short_url)
    end
  end

  def num_clicks
    self.visitors.count
  end

  def num_uniques
    self.visitors.distinct.count
  end

  def num_recent_uniques
    self.visitors.where("visits.created_at >= ?", 10.minutes.ago).distinct.count
  end
end