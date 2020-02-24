## ASP.NET Core 3.1 MVC - Linux

Created with `dotnet new mvc -au None -o sample-web-app`. It generates traces like this: https://cl.ly/eb7eee806839 and app analytics: https://cl.ly/6a1e376c9b71. 

### Quick start

1. Build the images: `docker-compose build --no-cache`
2. Spin up the containers: `docker-compose up` or `docker-compose up -d`
3. In a different terminal, wait a few minutes, then exec into the application container then curl an endpoint to generate traces.

`docker exec -it docker-dotnet31_web_1 bash` then

`curl -k "https://localhost:5001"`

4. Profiler logs are inside the container at: `/var/log/datadog`

If anyone knows how to map the certs and ports to outside the Docker containers, please contribute! :)

Resources:

1. Dotnet cli: https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-new?tabs=netcore22