class GamesController < ApplicationController
  def new
    # TODO: generate random grid of letters
    # 1 generer grid avec des lettres (grid_size) aleatoires (random pour chaque lettre)
    @letters = []
    10.times { @letters << ('a'..'z').to_a.sample.upcase }
    @letters
  end

  def score
    attempt = params[:attempt]
    word_in_grid?(attempt, letter)
  end

  private
  def word_in_grid?(word, array_letter)
    word.upcase.split(//).each do |letter|
      # array_letter.delete(letter) if array_letter.include?(letter) ? array_letter.delete(letter) : return false
      # p "#{letter.upcase} - #{array_letter}"
      if array_letter.include?(letter)
        array_letter.delete_at(array_letter.find_index(letter))
      else
        return false
      end
    end
    true
  end
end
