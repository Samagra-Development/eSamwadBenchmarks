counter = 0

request = function()
    wrk.headers["Authorization"] = "Bearer "..os.getenv("TOKEN")
    wrk.headers["Content-Type"] = "application/json"
    wrk.headers["Accept-Encoding"] = "gzip, deflate, br"
    return wrk.format(nil, path)
end

rcounter = 0
  
response = function(status, headers, body)
    if status == 200 then
        rcounter = rcounter + 1
    else
        print(status)
    end
    return wrk.format(rcounter)
end

done = function(summary, latency, requests)
    print("Total requests with 200 status: "..rcounter)
end