class ShortUrl < ApplicationRecord
    belongs_to :user, optional: true
    validates_presence_of :url
    validates :original_url, format: URI::regexp(%w[http https])
    validates_uniqueness_of :slug
end
