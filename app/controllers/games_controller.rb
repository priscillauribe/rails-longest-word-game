class GamesController < ApplicationController

    def new
      @letters = random_letters(10)
    end

    private

    def random_letters(count)
      alphabet = ('A'..'Z').to_a
      letters_array = []

      count.times do
        letters_array << alphabet.sample
      end

      letters_array
    end
end
