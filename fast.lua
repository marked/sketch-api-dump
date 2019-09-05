wget.callbacks.get_urls = function(file, url, is_css, iri)
  local next_fh = assert(io.popen("jq .result.paging.next '" .. file .. "'"))
  local next = next_fh:read('*all')
  next = next:gsub("\"", "")
  next = next:gsub("\n", "")
  print(next)
  return {
    {
      url="https://sketch.sonymobile.com/api/1/feed/global/list/default/" .. next,
      link_expect_html=0,
      link_expect_css=0
    }
  }
end
