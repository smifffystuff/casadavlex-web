#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["CasaDavLex.com/Server/CasaDavLex.com.Server.csproj", "CasaDavLex.com/Server/"]
COPY ["CasaDavLex.com/Client/CasaDavLex.com.Client.csproj", "CasaDavLex.com/Client/"]
COPY ["CasaDavLex.com/Shared/CasaDavLex.com.Shared.csproj", "CasaDavLex.com/Shared/"]
RUN dotnet restore "CasaDavLex.com/Server/CasaDavLex.com.Server.csproj"
COPY . .
WORKDIR "/src/CasaDavLex.com/Server"
RUN dotnet build "CasaDavLex.com.Server.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "CasaDavLex.com.Server.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "CasaDavLex.com.Server.dll"]