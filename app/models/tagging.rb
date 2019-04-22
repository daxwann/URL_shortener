class Tagging < ApplicationRecord
  validates :url_id, :topic_id, presence: true
  validates :url_id, uniqueness: { scope: :topic_id }

  belongs_to :shortened_url,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :ShortenedUrl
  
  belongs_to :tag_topic,
    primary_key: :id,
    foreign_key: :topic_id,
    class_name: :TagTopic
end