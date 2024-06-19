FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS builder
WORKDIR /src
COPY *.csproj /src
ARG TARGETARCH
RUN dotnet restore -a $TARGETARCH

# copy build files
COPY . /src/

# build
RUN dotnet publish --no-restore -c Release -a $TARGETARCH -o /app

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine-composite AS image
WORKDIR /app
COPY --from=builder /app .
USER app
ENTRYPOINT ["./test.sh"]
