module MoviesHelper

  def short(movie)

    movie.description.truncate(40, separator: ' ')

  end

  def total_gross(movie)
    if movie.flop?
      "Flop!"
    else
      number_to_currency(movie.total_gross, precision: 0)
    end
  end

  def year_of(movie)
    #  movie.released_on.strftime("Released on %Y")
    movie.released_on.year
  end

  def nav_link_to(text, url)
  if current_page?(url)
    link_to(text, url, class: "active")
  else
    link_to(text, url)
  end
end
end
