require 'pry'
class Museum

  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
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

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest

    patron_array = exhibits.map do |exhibit|
      patrons.select do |patron|
        patron.interests.include?(exhibit.name)
      end
    end

    exhibits.zip(patron_array).to_h

  end

end
