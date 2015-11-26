require 'rmagick'

module Helpers
  MASTERS = YAML.load(File.open('greate-masters.yml'))
  def greate_master_showcases(&block)
    Helpers::MASTERS['items'].map do |item|
      <<-HTML
        <div class='showcase-item collective-#{item["id"]} '>
          <div class='background-image'></div>
          <div class="info">
            <div class="inner">
              <p>来自大师的书单推荐</p>
              <p><strong>#{item['name']}</strong></p>
              <div>
                <a class="btn btn-collective"
                  href="/collectives/#{item["id"]}.html">浏览一下</a>
              </div>
            </div>
          </div>
        </div>
      HTML
    end.join('')
  end
  def book(name, isbn, language="zh-cn")
    return <<-HTML
      <div class="book">
        <a href="http://www.douban.com/isbn/#{isbn}"
          target="_blank">
          <img alt="#{name}"
            src="/images/collectives/#{current_page.data.id}/books/#{isbn}.jpg">
        </a>
        <h3 style="display:none;">#{name}</h3>
      </div>
    HTML
  end
end
