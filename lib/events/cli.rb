module Events
  class CLI
    def initialize(output, argv)
      @output = output
      @date   = argv.empty? ? Date.today : Date.parse(argv.shift)
    end

    def run
      @output.puts Events.address_book.upcoming(@date)
    end
  end
end