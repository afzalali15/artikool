FROM dart 
WORKDIR /app

COPY . .
RUN chmod +x "/app/bin/main.dart"
ADD pubspec.* /app/
RUN dart pub get
ADD . /app
RUN dart pub get --offline

# EXPOSE 8080
ENTRYPOINT ["dart","/app/bin/main.dart -m staging"]