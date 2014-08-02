module XOX
  class Board
    Positions = ["A1", "B1", "C1", "A2", "B2", "C2", "A3", "B3", "C3"]

    def initialize(squares)
      @squares = squares
    end

    def [](position)
      squares[position]
    end

    def play(counter, position)
      raise ArgumentError, "#{position} is full" unless self[position].empty?
      Board.new squares.merge(position => Square::Full[counter])
    end

    def won?
      !winning_line.nil?
    end

    def full?
      squares.values.none?(&:empty?)
    end

    def winner
      winning_line.first.counter
    end

    def to_s
      <<-BOARD
          A   B   C
        -------------
      1 | #{self['A1']} | #{self['B1']} | #{self['C1']} |
        -------------
      2 | #{self['A2']} | #{self['B2']} | #{self['C2']} |
        -------------
      3 | #{self['A3']} | #{self['B3']} | #{self['C3']} |
        -------------
      BOARD
    end

    private

    attr_reader :squares

    def winning_line
      @winning_line ||= (rows + columns + diagonals).find do |(x, y, z)|
        !x.empty? && x == y && y == z
      end
    end

    def rows
      '123'.chars.map do |row|
        'ABC'.chars.map { |col| self[col + row] }
      end
    end

    def columns
      'ABC'.chars.map do |col|
        '123'.chars.map { |row| self[col + row] }
      end
    end

    def diagonals
      [
        [self['A1'], self['B2'], self['C3']],
        [self['C1'], self['B2'], self['A3']]
      ]
    end

    def self.empty
      Board.new Positions.reduce({}) { |acc, p| acc.merge(p => Square::Empty) }
    end

  end
end
