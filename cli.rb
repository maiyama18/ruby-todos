require 'json'

class Cli
  PROMPT = '>> '

  def initialize
    @todos = []
  end

  def run
    loop do
      print PROMPT

      command = gets.chomp
      case command
      when 'list'
        puts 'list'
      when 'add'
        puts 'add'
      when 'remove'
        puts 'remove'
      when 'done'
        puts 'done'
      when 'usage', 'help'
        print_usage
      when 'exit', 'bye'
        bye
      else
        print_usage
      end
    end
  end

  def print_usage
    puts <<~USAGE
      commands
        list [--done|undone]
        add TITLE
        remove NUMBER
        done NUMBER
    USAGE
  end

  def bye
    puts 'bye'
    exit(0)
  end
end
