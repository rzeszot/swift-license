require 'sinatra'
require 'byebug'

def pkt_line(content)
  "%04x%s" % [content.size + 4, content]
end

def pkt_flush
  "0000"
end

get '/info/refs' do
  headers 'Content-Type' => 'application/x-git-upload-pack-advertisement',
          'Cache-Control' => ' no-cache'

  body [
    pkt_line("# service=git-upload-pack\n"),
    pkt_flush,
    pkt_line("f759e3d9b1d7d86c480a86f0432d8551aa5f5321 refs/heads/main\n"),
    pkt_flush
  ].join
end

post '/git-upload-pack' do
  # body = request.body.read
end
