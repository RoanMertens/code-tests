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
    word = hangman.show_word
    puts word
    puts "The word has #{hangman.word_length} letters."
    puts 'What is your guess? (Only one letter please!)'
    letter = gets.chomp
    hangman.check_letter(letter)
    puts hangman.end?
  end

  puts `clear`
  puts hangman.frame
  if hangman.total_mistakes > 9
    puts 'YOU DIED!'
    puts
    puts "The correct word was: #{hangman.correct_word}"
    puts
    puts "In the end you had: #{hangman.show_word}"
  else
    puts 'YOU WON!'
    puts
    puts "You had #{10 - hangman.total_mistakes} guesses left."
    puts "The word was: #{hangman.hidden}"
    puts
    puts 'Good Job!'
  end
  puts
  puts 'Do you want to play again? (y/n)'
  playing = gets.chomp
end
