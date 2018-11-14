# The hangman game
class Hangman
  attr_accessor :mistakes, :word, :frame
  def initialize
    @mistakes = []
    @words = %w[kiss dancing zen forward]
    @word = pick_word
    @frame = ['', '', '', '', '', '', '', '', '', '', '']
  end

  def pick_word
    @words.sample
  end

  def play_word
    case @mistakes.length
    when 0
      @frame = ['', '', '', '', '', '', '', '', '', '', '']
    when 1
      @frame.last = '|\_________'
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
      @frame[4, 2] = ['|/    |', '|     |']
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
