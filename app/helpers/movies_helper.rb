module MoviesHelper

 def total_gross(movie)
  if movie.flop?
    "Flop!"
  else
    number_to_currency(movie.total_gross, precision: 0)
  end
 end

 def day_and_time(movie)
    movie.released_on.strftime('%B %d at %I:%M %P')
 end

end
