module XOX
  class CLI
    extend Forwardable

    def initialize(input = STDIN, output = STDOUT)
      @input  = input
      @output = output
    end

    def ask(question, &valid)
      begin
        puts question
        print "?- "
        answer = gets.strip.upcase
      end while !valid.nil? && !valid.call(answer)
      answer
    end

    def_delegators :output, :print, :puts
    def_delegator :input, :gets

    private

    attr_reader :output, :input
  end
end
