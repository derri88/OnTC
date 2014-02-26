require 'csv'
module Jekyll
  module ShowAsTable
    def show_as_table(input)
      @DoxUrl = ""
      @DoxName = ""
      #Table variables ---Begin
      @Table        = ""
      @TableBegin   = "<table>"
      @TableEnd     = "</table>"
      @RowBegin     = "<tr>"
      @RowEnd       = "</tr>"
      @ColumnBegin  = "<td>"
      @ColumnEnd    = "</td>"
      #Table variables ---End

      @context.registers[:site].pages.each do |page|
        if page.data['DoxID'] == input
        #if page.data['DoxType'] == "DoxType_RCList"
          @Table += @TableBegin
          CSV.parse(page.content) do |row|
            @Table += @RowBegin
            for cell in row
              @Table += @ColumnBegin
              @Table += cell
              @Table += @ColumnEnd
            end
            @Table += @RowEnd
          end
          @Table += @TableEnd
          page.output = @Table

        end
        @Table = ""
      end
      return ""

    end
  end
end

Liquid::Template.register_filter(Jekyll::ShowAsTable)