module Alxmas
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        rating = 0
        films = array.select do |film|
          rating += film['rating_kinopoisk'].to_f if film['rating_kinopoisk'].to_f.positive? &&
              film['country'].to_s.split(',').count >= 2
        end
        rating/films.count
      end

      def chars_count(films, threshold)
        films.count do |film| film['rating_kinopoisk'].to_f >= threshold &&
            film['name'].include?('и')
        end
        end
      end
    end
  end
