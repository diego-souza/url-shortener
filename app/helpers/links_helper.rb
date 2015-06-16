module LinksHelper
  def code_url(request, code)
    "http://#{request.domain}:#{request.port}/#{code}"
  end
end
