module Jekyll
  module Menu
    def menu(input)
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
                    </head>"
      @PageEnd = "</html>"
      @Theme = get_theme(input)
      @Menu = ""
      @Menu += "<ul class=\"#{@Theme.data['MenuHeader']}\">"
      @context.registers[:site].pages.each do |page|
        if page.data['DoxType'] == "DoxType_RCList"
          @Menu += @PageBegin
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
      @Menu += @PageEnd
      return @Menu
    end
  end
end
Liquid::Template.register_filter(Jekyll::Menu)