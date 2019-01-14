require 'json'
require_relative './todo'

class Cli
  PROMPT = '>> '

  def initialize
    @todos = []
  end

  def run
    loop do
      print PROMPT

      command, *opts = gets.chomp.split(' ')
      case command
      when 'list'
        @todos.each do |todo|
          puts todo.format
        end
      when 'add'
        title = opts.join(' ')
        next if title.empty?

        @todos << Todo.new(title)
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
        remove ID
        done ID
    USAGE
  end

  def bye
    puts 'bye'
    exit(0)
  end
end
