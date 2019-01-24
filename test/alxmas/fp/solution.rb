module Alxmas
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films = array.select do |film|
          film['rating_kinopoisk'].to_f.positive? &&
              film['country'].to_s.split(',').count >= 2
        end
        rating = films.reduce(0) {|acc, film| acc + film['rating_kinopoisk'].to_f}
        rating/films.count
      end

      def chars_count(films, threshold)
        films.select { |film| film['rating_kinopoisk'].to_f >= threshold &&
            film['name'].include?('и') }
            .count
        end
      end
    end
  end
