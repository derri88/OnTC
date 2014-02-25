module Jekyll
  module ShowAsNamedLink
    def show_as_named_link(input)
      @DoxUrl = ''
      @DoxName = ''
      # get dox document as proper class
      # write and return html code

      @context.registers[:site].pages.each do |page|
        if page.data['DoxID'] == input
          @DoxUrl = page.data['DoxURL']
          @DoxName = page.data['DoxName']
        end
      end
      if @DoxUrl.length > 0
        %|
          <div id="question-header">
            <h1 itemprop="name">
              <a href="#{@DoxUrl}" class="question-hyperlink">#{@DoxName}</a>
            </h1>
          </div>|
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::ShowAsNamedLink)