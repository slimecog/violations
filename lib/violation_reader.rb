require "csv"
class ViolationReader
  attr_reader :data

  def initialize
    @data = []
    @load = load_data
  end

  def load_data
    CSV.foreach('data/Violations-2012.csv', headers: true,
                header_converters: :symbol, converters: :numeric) do |row|
      @data << {violation_category: row[:violation_category],
                violation_date:     row[:violation_date]
                }
    end
  end

  def group_by_category
    @data.group_by { |v| v[:violation_category] }
  end

  # def find_count
  #   group_by_category.keys.each_with_object(Hash.new(0)) do |h1, h2|
  #     h2[h1[:violation_category]] += 1
  #   end
  # end

  # def find_count
  #   group_by_category.map { |k| k[:violation_category] }
  # end
end

# count, date of earliest violation, and date of latest violation
