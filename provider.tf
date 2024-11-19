provider "splunk" {
  url                  = var.splunk_url
  auth_token           = var.splunk_token
  insecure_skip_verify = true
}

# provider "splunk" {
#   url                  = "127.0.0.1:8089" 
#   auth_token           = "eyJraWQiOiJzcGx1bmsuc2VjcmV0IiwiYWxnIjoiSFM1MTIiLCJ2ZXIiOiJ2MiIsInR0eXAiOiJzdGF0aWMifQ.eyJpc3MiOiJhZG1pbiBmcm9tIERFU0tUT1AtRlJTUkxWUCIsInN1YiI6ImFkbWluIiwiYXVkIjoiZGFzaGJvYXJkIGNyZWF0aW9uIiwiaWRwIjoiU3BsdW5rIiwianRpIjoiNWY1YjBlYTg1NmY2NDM4ZDA2ZTMzOTdiYmRjMjg5OTZkZDUwMWRkMzZhZWI0MTdkYjEyNmM2OTNkNjc2YzM0NyIsImlhdCI6MTczMDcxODM4NCwiZXhwIjoxNzMyOTkxMzQwLCJuYnIiOjE3MzA3MTgzODR9.tSd6wzY-iDETI2mxCC6amEZZTzETEFfSsO9uGfyWgUGQUXPIzdoZg7viVmb4ePPbhwhU3r2GS0zd46b6HxhY7w"
#   insecure_skip_verify = true
# }