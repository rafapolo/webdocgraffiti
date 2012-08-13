xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "WEBDOC GRAFFITI"
    xml.description "WEBDOC GRAFFITI"
    xml.link "webdocgrafiiti.com.br"

    for video in @videos
      xml.item do
        xml.title video.titulo
        xml.author "WDG"
        xml.description video.sinopse
        xml.pubDate video.updated_at.to_s(:rfc822)
        xml.link "http://webdocgrafiiti.com.br/#{video.episodio.urlized}/#{video.urlized}"
        xml.guid "http://webdocgrafiiti.com.br/#{video.episodio.urlized}/#{video.urlized}"
      end
    end
  end
end