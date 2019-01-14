require 'securerandom'

class Todo
  attr_accessor :id, :title, :is_done

  def initialize(title, id = nil, is_done = false)
    @id = id || SecureRandom.uuid[0..3]
    @title = title
    @is_done = is_done
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

  def serialize
    %Q({"id": "#{@id}", "title": "#{@title}", "is_done": #{done?}})
  end
end