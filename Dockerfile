FROM mcr.microsoft.com/dotnet/core/sdk:3.1

RUN apt-get update && apt-get install -y bash curl

WORKDIR /home

COPY data/sample-web-app sample-web-app

EXPOSE 5050

WORKDIR /home/sample-web-app

RUN mkdir /var/log/datadog/

ENV CORECLR_ENABLE_PROFILING=1
ENV CORECLR_PROFILER={846F5F1C-F9AE-4B07-969E-05C26BC060D8}
ENV CORECLR_PROFILER_PATH=/opt/datadog/Datadog.Trace.ClrProfiler.Native.so
ENV DD_INTEGRATIONS=/opt/datadog/integrations.json
ENV DD_DOTNET_TRACER_HOME=/opt/datadog
ENV ASPNETCORE_URLS="http://*:5050"

RUN mkdir -p /opt/datadog
RUN curl -LO https://github.com/DataDog/dd-trace-dotnet/releases/download/v1.13.0/datadog-dotnet-apm_1.13.0_amd64.deb
RUN apt install ./datadog-dotnet-apm_1.13.0_amd64.deb

ADD entrypoint.sh /home/sample-web-app/entrypoint.sh
RUN chmod +x /home/sample-web-app/entrypoint.sh
CMD ["sh", "entrypoint.sh", "/home/sample-web-app/bin/Debug/netcoreapp3.1/sample-web-app.dll"]