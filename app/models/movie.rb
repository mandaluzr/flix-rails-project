class Movie < ApplicationRecord

    def flop?
        total_gross.blank? || total_gross.zero?
    end
end
