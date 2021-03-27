class ShortUrl < ApplicationRecord
    belongs_to :user, optional: true
    validates_presence_of :original_url, :slug
    validates :original_url, format: URI::regexp(%w[http https])
    validates_uniqueness_of :slug


    def add_random_slug
        self.slug = generate_unique_slug
    end

    def generate_unique_slug
        s = rand(36**8).to_s(36)
        generate_unique_slug if ShortUrl.find_by(slug: s)
        s
    end
end
