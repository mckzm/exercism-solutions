class Matrix
  attr_reader :columns, :rows, :string_rep

  def initialize(string_rep)
    @string_rep = string_rep
    @rows = []
    string_rep.each_line { |l| @rows << l.split.map { |e| e.to_i } }
    @columns = Array.new(rows[0].size) {[]}
    rows.each { |r| r.each_with_index { |e, i| @columns[i] << e } }
  end

  def row(n)
    rows[n - 1]
  end

  def column(n)
    columns[n - 1]
  end
end
