# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# คัดลอก csproj และ restore ก่อน (เพื่อให้ Docker cache layer นี้ไว้ได้)
COPY ["GooruuSearchApp.csproj", "./"]
RUN dotnet restore "GooruuSearchApp.csproj"

# คัดลอกไฟล์ทั้งหมดแล้ว Publish
COPY . .
RUN dotnet publish "GooruuSearchApp.csproj" -c Release -o /app/publish

# Stage 2: Run
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app/publish .

# ตั้งค่า Port ให้ตรงกับที่ Render ต้องการ (Render จะส่งค่า PORT มาทาง Env Variable)
# แต่เราตั้ง Default ไว้ที่ 8080
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

# *** ตรวจสอบชื่อไฟล์ dll ตรงนี้ให้ตรงกับชื่อโปรเจกต์ของคุณ ***
ENTRYPOINT ["dotnet", "GooruuSearchApp.dll"]