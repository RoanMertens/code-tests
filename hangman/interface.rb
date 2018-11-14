# hangman interface
require_relative 'hangman'
playing = 'y'

until playing.casecmp('n').zero?
  puts `clear`
  hangman = Hangman.new
  hangman.hide_word

  puts 'Hangman'
  puts hangman.full_frame
  puts 'Yeeehaw!'
  sleep(1)

  until hangman.end == true
    puts `clear`
    puts hangman.frame
    hangman.hidden
    word = hangman.show_word
    puts word
    puts "The word has #{hangman.word_length} letters."
    puts 'What is your guess? (Only one letter please!)'
    letter = gets.chomp

    hangman.check_letter(letter)
    hangman.check_mistakes
    puts hangman.end?
    puts hangman.mistakes.length
  end

  puts hangman.frame
  puts `clear`
  puts "You ended!"
  puts
  # input a word
  # show lines
  # show length word
  # make guess
  # check guess

  puts 'Do you want to play again? (y/n)'
  playing = gets.chomp
end
