class DoxReader
  def self.get_dox_by_id(id)
    @dox = Dox.new(
        id,
        'Passing variables to model instance methods in Liquid templates',
        'http://stackoverflow.com/questions/3596127/passing-variables-to-model-instance-methods-in-liquid-templates')
  end
end