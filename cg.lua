counter = 0

request = function()
    wrk.method = "POST"
    wrk.body   = '{"query":"query fetchStudentDetails($id:Int){\r\n  student(where:{id:{_eq:$id},is_enabled:{_eq:true}}){\r\n    name\r\n    grade_number\r\n    section\r\n    stream_tag\r\n    id\r\n    school{\r\n      udise\r\n      name\r\n      location{\r\n        district\r\n        block\r\n      }\r\n    }\r\n  }\r\n}","variables":{"id":'..tostring(240755+counter)..'}}'
    wrk.headers["Authorization"] = os.getenv("TOKEN")
    wrk.headers["Content-Type"] = "application/json"
    counter = counter + 1
    return wrk.format(nil, path)
end

rcounter = 0
  
response = function(status, headers, body)
    if status == 200 then
        rcounter = rcounter + 1
    else
        print(status, body)
    end
    return wrk.format(rcounter)
end