class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, presence: true, uniqueness: true
  validates :submitter_id, presence: true
  validate :no_spamming, :nonpremium_max

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

  has_many :taggings,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Tagging,
    dependent: :destroy

  has_many :tag_topics,
    through: :taggings,
    source: :tag_topic

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

  private

  def no_spamming
    last_minute_count = ShortenedUrl
      .where('created_at >= ?', 1.minute.ago)
      .where(submitter: submitter_id)
      .count

    errors[:maximum] << 'of five shortened URLs per minute' if last_minute_count >= 5
  end

  def nonpremium_max
    return if User.find(self.submitter).premium

    total_urls = ShortenedUrl
      .where(submitter: submitter_id)
      .count
    
    errors[:only] << 'premium members can create more than five shortened URLs' if total_urls >= 5
  end
end