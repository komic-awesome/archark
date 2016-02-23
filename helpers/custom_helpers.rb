require 'rmagick'

module CustomHelpers
  MASTERS = YAML.load(File.open('greate-masters.yml'))
  def greate_master_showcases(&block)
    CustomHelpers::MASTERS['items'].map do |item|
      href = url_for("/collectives/#{item["id"]}.html")
      <<-HTML
        <div class='showcase-item collective-#{item["id"]} '>
          <div class='background-image'></div>
          <div class="info">
            <div class="inner">
              <p>来自大师的书单推荐</p>
              <p><strong>#{item['name']}</strong></p>
              <div>
                <a class="btn btn-collective"
                  href="#{href}">浏览一下</a>
              </div>
            </div>
          </div>
        </div>
      HTML
    end.join('')
  end

  def book(name, author, isbn, language="zh-cn")
    path = "images/collectives/#{current_page.data.id}/books/#{isbn}.jpg"
    img = ::Magick::Image::read("source/#{path}").first
    pix = img.scale(1, 1)
    backgorund_color = pix.to_color(pix.pixel_color(0, 0))
    image_tag_html = image_tag(path)
    return <<-HTML
      <div class="book-wrapper">
        <div class="book">
          <div class="book-front">
            #{image_tag_html}
          </div>
          <div class="book-back"></div>
          <div class="book-left" style="background-color: #{backgorund_color};">
          </div>
          <h3 style="display:none;">#{name}</h3>
          <a class="fake-link"
            href="http://book.douban.com/isbn/#{isbn}/">
          </a>
        </div>
        <div class="bd">
          <h4>#{name}</h4>
          <hr></hr>
          <p class="author">#{author}</p>
        </div>
      </div>
    HTML
  end
end
