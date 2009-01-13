module Events
  class RecurringDate
    def self.parse(original)
      new(Date.parse(original))
    end

    def initialize(original)
      @original = original
    end

    def next_occurrence(from = Date.today)
      Occurrence.new(@original, from)
    end

    private

    class Occurrence
      def initialize(original, from)
        @date     = Date.new(from.year, original.month, original.day)
        @date     = Date.new(from.year + 1, original.month, original.day) if @date < from
        @from     = from
        @original = original
      end

      def method_missing(symbol, *args, &block)
        @date.send(symbol, *args, &block)
      end

      def days_until
        @date - @from
      end

      def years_since
        @date.year - @original.year
      end
    end
  end
end