wget.callbacks.get_urls = function(file, url, is_css, iri)

  os.execute("./process.sh '" .. file .. "'") -- non-blocking

  local next_fh = assert(io.popen("./next.sh '" .. file .. "'")) -- blocking
  local next = next_fh:read('*all')
  next = next:gsub("\n", "")
  print("Next:" .. next)

  return {
    {
      url="https://sketch.sonymobile.com/api/1/feed/global/list/default/" .. next,
      link_expect_html=0,
      link_expect_css=0
    }
  }
end
