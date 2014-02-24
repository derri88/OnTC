class Dox
  attr_accessor :id, :name, :url

  def initialize(id, name, url)
    @id = id
    @name = name
    @url = url
  end

  def to_liquid
    {
        'id'=>self.id,
        'name'=>self.name,
        'url'=>self.url
    }
  end
end