class Matrix
  attr_reader :columns, :rows

  def initialize(string_rep)
    @rows = string_rep.lines.map { |row| row.split.map(&:to_i) }
    @columns = rows.transpose
  end

  def row(i)
    rows[i - 1]
  end

  def column(i)
    columns[i - 1]
  end
end
