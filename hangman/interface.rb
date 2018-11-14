# hangman interface
require_relative 'hangman'

puts 'Hangman'
puts
puts ''
playing = 'y'
outcome = 'lose'
guesses = 0

until playing.casecmp('n').zero?
  hangman = Hangman.new
  word = hangman.word
  puts '- ' * word.length
  puts "The word has #{word.length} letters."
  puts "You have #{guesses} right guesses."

  puts "You #{outcome}!"
  puts 'Want to play again? (y/n)'
  playing = gets.chomp
end

counter = 0

puts 'Which letter do you guess?'

letter = gets.chomp
