  # syntax=docker/dockerfile:1
  FROM node:alpine AS base
  WORKDIR /App
  RUN npm --versionRUN apk --no-cache --virtual build-dependencies add \
    git \
    python \
    make \
    g++
  COPY . ./
  WORKDIR /App/Account/ClientApp
  RUN npm install
  RUN npm run build
  FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
  WORKDIR /App
  #COPY . ./
  RUN dotnet restore
  RUN dotnet publish -c Release -o Account/bin/Release/net5.0/
  FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS production
  COPY Account/bin/Release/net5.0/ App/
  WORKDIR /App
#ENTRYPOINT [ "dotnet", "Account.dll" ]