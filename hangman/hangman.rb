# The hangman game
class Hangman
  attr_reader :mistakes, :frame, :guesses, :hidden, :end
  def initialize
    @mistakes = []
    @words = %w[kiss dancing zen forward]
    @word = pick_word
    @hidden = []
    @frame = ['', '', '', '', '', '', '', '', '', '', '']
    @guesses = 0
    @end = false
  end

  def end?
    check_mistakes
    @end = true if @mistakes.length > 9 || @word == @hidden
  end

  def check_letter(letter)
    if @word.include?(letter)
      @word.each_with_index do |l, index|
        @hidden[index] = letter if l == letter
      end
    elsif @mistakes.include?(letter)
      puts "You alreaddy guessed the letter #{letter}"
    else
      @mistakes.push(letter)
    end
  end

  def hide_word
    @word.length.times { @hidden << '-' }
  end

  def word_length
    @word.length
  end

  def show_word
    @hidden.join(' ')
  end

  def pick_word
    @word = @words.sample.split('')
  end

  def full_frame
    ['___________',
     '|/    |',
     '|     |',
     '|     O',
     '|    /|\ ',
     '|   / | \ ',
     '|    / \ ',
     '|   /   \ ',
     '|',
     '|',
     '|\_________']
  end

  def check_mistakes
    case @mistakes.length
    when 0
      @frame = ['', '', '', '', '', '', '', '', '', '', '']
    when 1
      @frame[-1] = '|\_________'
    when 2
      @frame = ['', '|/', '|', '|', '|', '|', '|', '|', '|', '|',
                '|\_________']
    when 3
      @frame = ['___________', '|/', '|', '|', '|', '|', '|', '|', '|', '|',
                '|\_________']
    when 4
      @frame[1, 2] = ['|/    |', '|     |']
    when 5
      @frame[3] = ['|     O']
    when 6
      @frame[4, 2] = ['|     |', '|     |']
    when 7
      @frame[4, 2] = ['|    /|', '|   / |']
    when 8
      @frame[4, 2] = ['|    /|\ ', '|   / | \ ']
    when 9
      @frame[6, 2] = ['|    /   ', '|   /     ']
    when 10
      @frame[6, 2] = ['|    / \ ', '|   /   \ ']
    end
  end
end
