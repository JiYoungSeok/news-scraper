class Article < ApplicationRecord
  enum category: { politics: 0, economy: 1, society: 2, life: 3, world: 4, it: 5 }
  enum platform: { naver: 0 }

  validates :category, presence: true
  validates :platform, presence: true
  validates :title, presence: true
  validates :url, presence: true
end
