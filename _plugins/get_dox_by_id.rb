module Jekyll
  module GetDoxById
    def get_dox_by_id(input)
      # get dox document as proper class
      DoxReader.get_dox_by_id(input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::GetDoxById)