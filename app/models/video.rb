class Video < ApplicationRecord
  validates :name, presence: true
  validates :videoId, presence: true
end
