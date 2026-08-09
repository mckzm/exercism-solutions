# Secret knowledge of the Zhang family:
class Zhang
  def self.bank_number_part(secret_modifier)
    zhang_part = 8_541
    zhang_part * secret_modifier % 10_000
  end

  class Red
    def self.code_fragment
      512
    end
  end

  class Blue
    def self.code_fragment
      677
    end
  end
end

# Secret knowledge of the Khan family:
class Khan
  def self.bank_number_part(secret_modifier)
    khan_part = 4_142
    khan_part * secret_modifier % 10_000
  end

  class Red
    def self.code_fragment
      148
    end
  end

  class Blue
    def self.code_fragment
      875
    end
  end
end

# Secret knowledge of the Garcia family:
class Garcia
  def self.bank_number_part(secret_modifier)
    garcia_part = 4_023
    garcia_part * secret_modifier % 10_000
  end

  class Red
    def self.code_fragment
      118
    end
  end

  class Blue
    def self.code_fragment
      923
    end
  end
end

class EstateExecutor
  @families = [Zhang, Khan, Garcia]
  @colours = [:Blue, :Red]

  def self.assemble_account_number(secret_modifier)
    @families.reduce(0) { |acc, c| acc + c.bank_number_part(secret_modifier) }
  end

  def self.assemble_code
    fragments = @colours.map do |color|
      @families.sum { |c| c.const_get(color).code_fragment }
    end

    fragments.reduce(:*)
  end
end
