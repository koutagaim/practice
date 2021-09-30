# webrick.rb
require 'webrick'

server = WEBrick::HTTPServer.new({ 
  :DocumentRoot => './',
  :BindAddress => '127.0.0.1',
  :Port => 8000
})


server.mount_proc("/time") do |req, res|
    body = "<html>
    <body>
    #{Time.new}</body>
    </html>"
    res.status = 200
    res['Content-Type'] = 'text/html'
    res.body = body
  end
  server.mount_proc("/time") do |req, res|
    body = "<html><meta charset='utf-8'><body>#{Time.now}</body></html>"
    res.status = 200
    res['Content-Type'] = 'text/html'
    res.body = body
  end
  
  server.mount_proc("/get_form") do |req, res|
    body = "<html><meta charset='utf-8'><body>\n"
    body += "クエリパラメーターは#{req.query}です<br>\n"
    body += "こんにちは#{req.query['username']}さん。あなたの年齢は#{req.query['age']}ですね"
    body += "</body</html>\n"
    res.status = 200
    res['Content-Type'] = 'text/html'
    res.body = body
  end
  
  server.mount_proc("/post_form") do |req, res|
    body = "<html><meta charset='utf-8'><body>\n"
    body += "フォームデータは#{req.query}です<br>\n"
    body += "こんにちは#{req.query['username']}さん。あなたの年齢は#{req.query['age']}ですね"
    body += "</body</html>\n"
    res.status = 200
    res['Content-Type'] = 'text/html'
    res.body = body
  end
  
  
  server.start