module XOX
  module Square

    class Full
      def self.[](counter)
        Full.new(counter)
      end

      def initialize(counter)
        @counter = counter
      end

      def empty?
        false
      end

      def to_s
        counter
      end

      def ==(other)
        other.is_a?(Square::Full) && other.counter == self.counter
      end
      alias_method :eql?, :==

      def hash
        counter.hash
      end

      attr_reader :counter
    end

    module Empty
      def self.empty?
        true
      end

      def self.to_s
        ' '
      end
    end

  end
end
