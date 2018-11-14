# The hangman game
class Hangman
  attr_reader :frame, :hidden, :end
  def initialize
    @mistakes = []
    @words = %w[kiss dancing zen forward]
    @word = pick_word
    @hidden = []
    @frame = ['', '', '', '', '', '', '', '', '', '', '']
    @end = false
  end

  def end?
    check_mistakes
    @end = true if total_mistakes > 9 || @word == @hidden
  end

  def check_letter(letter)
    if @word.include?(letter)
      @word.each_with_index do |l, index|
        @hidden[index] = letter if l == letter
      end
    elsif @mistakes.include?(letter) || letter.length > 1
    else
      @mistakes.push(letter)
    end
  end

  def total_mistakes
    @mistakes.length
  end

  def hide_word
    @word.length.times { @hidden << '-' }
  end

  def word_length
    @word.length
  end

  def correct_word
    @word.join(' ')
  end

  def show_word
    @hidden.join(' ')
  end

  def pick_word
    @word = @words.sample.split('')
  end

  def full_frame
    ['___________', '|/    |', '|     |', '|     O', '|    /|\ ', '|   / | \ ',
     '|    / \ ', '|   /   \ ', '|', '|', '|\_________']
  end

  def check_mistakes
    if total_mistakes <= 3
      zero_to_three
    elsif total_mistakes <= 7
      four_to_seven
    else
      eight_to_ten
    end
  end

  def zero_to_three
    case total_mistakes
    when 1
      @frame[-1] = '|\_________'
    when 2
      @frame[1, 9] = ['|/', '|', '|', '|', '|', '|', '|', '|', '|']
    when 3
      @frame[0] = '___________'
    end
  end

  def four_to_seven
    case total_mistakes
    when 4
      @frame[1, 2] = ['|/    |', '|     |']
    when 5
      @frame[3] = ['|     O']
    when 6
      @frame[4, 2] = ['|     |', '|     |']
    when 7
      @frame[4, 2] = ['|    /|', '|   / |']
    end
  end

  def eight_to_ten
    case total_mistakes
    when 8
      @frame[4, 2] = ['|    /|\ ', '|   / | \ ']
    when 9
      @frame[6, 2] = ['|    /   ', '|   /     ']
    when 10
      @frame[6, 2] = ['|    / \ ', '|   /   \ ']
    end
  end
end
