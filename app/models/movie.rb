class Movie < ApplicationRecord

    def self.released
        where("released_on > ?", Time.now).order("released_on")
    end

    def flop?
        total_gross.blank? || total_gross.zero?
    end
end
