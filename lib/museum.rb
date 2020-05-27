require 'pry'
class Museum

  attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(name)
    @exhibits << name
  end

  def recommend_exhibits(patron)
    exhibit_name = exhibits.map do |exhibit|
      exhibit.name
    end
    recommended = exhibit_name & patron.interests
    exhibits.select do |exhibit|
      recommended.include?(exhibit.name)
    end

  end

end
