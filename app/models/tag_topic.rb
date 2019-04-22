class TagTopic < ApplicationRecord
  validates :name, presence: true

  has_many :taggings,
    primary_id: :id,
    foreign_id: :topic_id,
    class_name: :Tagging,
    dependent: :destroy

  has_many :shortened_urls,
    through: :taggings,
    source: :shortened_url
end