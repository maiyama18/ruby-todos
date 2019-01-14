require 'securerandom'

class Todo
  def initialize(title)
    @id = SecureRandom.uuid[0..3]
    @title = title
    @done = false
  end

  def done?
    @done
  end

  def done
    @done = true
  end

  def undone
    @done = false
  end

  def format
    "[#{done? ? 'x' : ' '}] (#{@id}) #{@title}"
  end
end