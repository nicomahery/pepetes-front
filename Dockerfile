FROM fischerscode/flutter:2.5.1 AS build

RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --enable-web
USER root
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter pub get
RUN flutter build web

# Stage 2 - Create the run-time image
FROM nginx:1.21.1-alpine
COPY --from=build /app/build/web /usr/share/nginx/html