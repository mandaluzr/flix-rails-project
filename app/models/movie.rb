class Movie < ApplicationRecord

    has_many :reviews, dependent: :destroy

    validates :title, :released_on, :duration, presence: true

    validates :description, length: { minimum: 25 }

    validates :total_gross, numericality: { greater_than_or_equal_to: 0 }

    validates :image_file_name, allow_blank: true, format: {
        with:    /\w+\.(jpg|png)\z/i,
        message: "must be a JPG, or PNG image"
    }

    RATINGS = %w(G PG PG-13 R NC-17)

    validates :rating, inclusion: { in: RATINGS }

    def self.released
        where("released_on < ?", Time.now).order("released_on")
    end

    def flop?
        total_gross.blank? || total_gross.zero?
    end

    def average_stars
        reviews.average(:stars) || 0.0
    end
end
