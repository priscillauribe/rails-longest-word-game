require 'open-uri'
require 'json'
class GamesController < ApplicationController

    def new
      @letters = random_letters(10)
    end

    def random_letters(count)
      alphabet = ('A'..'Z').to_a
      letters_array = []

      count.times do
        letters_array << alphabet.sample
      end

      letters_array
    end

    def score
    # raise is to debug
    @word = params[:word]
    @letters = params[:letters]
    end

    # def calculate_time
    #   start_time = session[:start_time]
    #   end_time = Time.now
    #   time_taken = end_time - start_time
    #   time_taken
    # end


    # def calculate_score(word, time)
    #   length_score = word.length
    #   time_score = length_score / time
    #   total_score = length_score * time_score
    #   total_score
    # end

    def api_call(word)
      url = "https://wagon-dictionary.herokuapp.com/#{word}"
      response = open(url).read
      JSON.parse(response)
    end

  #   def valid_word_check
  #   if valid_word_check(@word, @letters)
  #     api = api_call(@word)
  #     if api['found']
  #       @time = calculate_time
  #       @score = calculate_score(@word, @time)
  #       @message = "You won!"
  #     else
  #       @score = 0
  #       @message = "doesn't seem to be a valid english word."
  #     end
  #   else
  #     @score = 0
  #     @message = "test can't be built out of those words."
  #   end
  # end
end
