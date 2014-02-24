module Jekyll
  module ReadDox
    def read_dox(input)

      @count = 0
      @objectArray = Array.new
      @name = 'a'
      @state = 'a'
      @id = 'a'
      @url = 'a'
      File.open("data/#{input}_.grid.dox", "r") do |data|
        while line = data.gets
          if @count == 2
            lineData = line.partition(',')
            @name = lineData[0]
            lineData = lineData[2].partition(',')
            @state = lineData[0]
            lineData = lineData[2].partition(',')
            @id = lineData[0].partition(' __ ')[2].partition(' __ ')[0]
            lineData = lineData[2].partition(',')
            @url = lineData[0]
            @objectArray.push Dox.new(
                @id,
                @name,
                @url,
                @state)

          end
          if line.include?("---")
            @count += 1
          end
        end
      end
      return @objectArray

    end
  end
end
Liquid::Template.register_filter(Jekyll::ReadDox)