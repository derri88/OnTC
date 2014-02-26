require 'csv'
module Jekyll
  module MakeAllTables
    def make_all_tables(input)

      @Theme = get_theme(input)
      @Menu = ""

      #Table variables ---Begin
      @Page = ""
      @PageBegin = "<html>
                    <head>
                      <meta name=\"description\" content=\"Static &amp; Dynamic Tables\" />
                      <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />
                      <link href=\"assets/css/bootstrap.min.css\" rel=\"stylesheet\" />
                      <link rel=\"stylesheet\" href=\"assets/css/font-awesome.min.css\" />
                      <link rel=\"stylesheet\" href=\"assets/css/ace-fonts.css\" />
                      <link rel=\"stylesheet\" href=\"assets/css/ace.min.css\" />
                      <link rel=\"stylesheet\" href=\"assets/css/ace-rtl.min.css\" />
                      <link rel=\"stylesheet\" href=\"assets/css/ace-skins.min.css\" />
                      <script src=\"assets/js/ace-extra.min.js\"></script>
                    </head>
                    <body>
                    <div class=\"main-container\" id=\"main-container\">
                      <script type=\"text/javascript\">
                        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
                      </script>
                        <div class=\"main-container-inner\">
                          <a class=\"menu-toggler\" id=\"menu-toggler\" href=\"#\">
                            <span class=\"menu-text\"></span>
                              </a>"
      @PageEnd = "    </div>
                     </div>
                    </body>
                  </html>"
      @TableBegin = "<div class=\"main-content\">
                      <div class=\"page-content\">
                        <div class=\"row\">
                         <div class=\"col-xs-12\">
                           <div class=\"row\">
                            <div class=\"col-xs-12\">
                                <div class=\"#{@Theme.data['TableMain']}\">
                                  <table id=\"sample-table-1\" class=\"#{@Theme.data['TableSub']}\">"
      @TableEnd = "               </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                     </table>"
      @TableContentBegin = "<tbody>"
      @TableContentEnd = "</tbody>"
      @MenuBegin = "<div class=\"sidebar\" id=\"sidebar\">
                      <script type=\"text/javascript\">
                          try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
                      </script>"
      @MenuEnd = "</div>"

      @RowBegin = "<tr>"
      @RowEnd = "</tr>"
      @ColumnBegin = "<td>"
      @ColumnEnd = "</td>"
      @TableHeaderBegin = "<thead>"
      @TableHeaderEnd = "</thead>"
      @HeaderBegin = "<th>"
      @HeaderEnd = "</th>"
      @Header = ""
      #Table variables ---End
      @Menu += @MenuBegin
      @Menu += "<ul class=\"#{@Theme.data['MenuHeader']}\">"
      @context.registers[:site].pages.each do |page|
        if page.data['DoxType'] == "DoxType_RCList"
          @Menu +="
          <li>
          <a href=\"#{page.data['DoxName']}.html\">
          <i class=\"#{@Theme.data['MenuIcon']}\"></i>
								<span class=\"#{@Theme.data['MenuText']}\"> #{page.data['DoxName']} </span>
          </a>
						</li>"
        end
      end
      @Menu += "</ul>"
      #@Menu += menu('Ace') --- Nie mozna uzywac bo jest definicja CSS
      @Menu += @MenuEnd

      @context.registers[:site].pages.each do |page|
        #if page.data['DoxID'] == input

        if page.data['DoxType'] == "DoxType_RCList"
          #Prepare header
          i = 0
          CSV.parse(page.content) do |row|
            for cell in row
              @Header += @HeaderBegin
              @Header += "Column#{i}"
              @Header += @HeaderEnd
            end
            break
          end

          @Page += @PageBegin
          @Page += @Menu
          @Page += @TableBegin
          @Page += @TableHeaderBegin
          @Page += @Header
          @Page += @TableHeaderEnd
          @Page += @TableContentBegin
          CSV.parse(page.content) do |row|
            @Page += @RowBegin
            for cell in row
              @Page += @ColumnBegin
              @Page += cell
              @Page += @ColumnEnd
            end
            @Page += @RowEnd
          end
          @Page += @TableContentEnd
          @Page += @TableEnd
          @Page += @PageEnd
          page.output = @Page
          @Page = ""
          @Header = ""
        end
      end
      return ""

    end
  end
end

Liquid::Template.register_filter(Jekyll::MakeAllTables)