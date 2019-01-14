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
        filter = {
          '--undone' => :undone,
          '--done' => :is_done,
        }[opts[0]]

        show_list(filter)
      when 'add'
        title = opts.join(' ')
        next if title.empty?

        @todos << Todo.new(title)
      when 'remove'
        @todos.delete_if { |t| t.id == opts[0] }
      when 'done'
        @todos = @todos.map { |t| (t.id == opts[0]) ? t.done : t }
      when 'usage', 'help'
        print_usage
      when 'exit', 'bye'
        bye
      else
        print_usage
      end
    end
  end

  def show_list(filter)
    todos = if filter == :undone
              @todos.select { |t| !t.done? }
            elsif filter == :is_done
              @todos.select { |t| t.done? }
            else
              @todos
            end

    todos.each do |todo|
      puts todo.format
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
