module ReviewsHelper
    def time_ago_in_words_for_review(review)
        "#{time_ago_in_words(review.created_at)} ago"
      end
end
