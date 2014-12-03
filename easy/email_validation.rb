class FileReader
  def self.open(file)
    File.open(file)
  end

  def self.cleanfile(file)
    open(file).readlines.map {|line| line.chomp}
  end
end

class EmailValidater
  def initialize(array_of_lines)
    @lines = array_of_lines
  end

  def validate_line(email)
    email.match(/^[\d\w\!\#\$\%\&\'\*\+\-\/\=\?\^\_\`\{\|\}\~]+@[\d\w\-^.]+.com$/) ? true : false
  end


  def validate_all
    @lines.each {|email| puts validate_line(email)}
  end
end


input_lines = FileReader.cleanfile(ARGV[0])
EmailValidater.new(input_lines).validate_all