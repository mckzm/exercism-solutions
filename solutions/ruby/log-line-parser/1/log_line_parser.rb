class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.sub(/\[.*\]:/, '').strip
  end

  def log_level
    @line.sub(/\[(.*)\].*/, '\1').strip.downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
