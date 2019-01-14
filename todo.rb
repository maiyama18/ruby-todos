require 'securerandom'

class Todo
  attr_accessor :id, :title, :is_done

  def initialize(title)
    @id = SecureRandom.uuid[0..3]
    @title = title
    @is_done = false
  end

  def done?
    @is_done
  end

  def done
    todo = self.clone
    todo.is_done = true

    todo
  end

  def format
    "[#{done? ? 'x' : ' '}] (#{@id}) #{@title}"
  end
end