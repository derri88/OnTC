module Jekyll
  module ShowAsNamedLink
    def show_as_named_link(input)
      # get dox document as proper class
      dox = DoxReader.get_dox_by_id(input)
      # write and return html code
      %|
<div id="question-header">
  <h1 itemprop="name">
    <a href="#{dox.url}" class="question-hyperlink">#{dox.name}</a>
  </h1>
</div>|
    end
  end
end

Liquid::Template.register_filter(Jekyll::ShowAsNamedLink)