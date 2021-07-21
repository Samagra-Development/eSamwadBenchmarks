### To run the script
```sh
export TOKEN=Bearer dfdhfdj
wrk -c200 -t50 -d 15 -s cg.lua http://139.59.46.189:8080/v1/graphql
```