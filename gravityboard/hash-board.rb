# puzzle class in which gravity puts all hashes as far down as possible.
class GravityPuzzleEm
  def solve(board)
    columnize(sorting(columnize(board)))
  end

  # take the elements from their row and putting them in a column
  def columnize(board)
    columns = []
    board.each_with_index do |row, index|
      row.length.times { columns << '' } if index.zero?
      row.split('').each_with_index { |char, i| columns[i] << char }
    end
    columns
  end

  # sorting the column
  def sorting(board)
    board.map { |row| row.split('').sort.reverse.join }
  end
end

puzzle = GravityPuzzleEm.new

array = ['#.#.#', '..#..', '...##']

box_a = puzzle.solve(['#', '.', '.'])
box_b = puzzle.solve(['##', '.#', '#.'])
box_c = puzzle.solve(array)

puts 'First box:'
box_a.each { |box| puts box }
puts 'Second box:'
box_b.each { |box| puts box }
puts 'Original third box:'
array.each { |box| puts box }
puts 'Third box:'
box_c.each { |box| puts box }
