FROM fischerscode/flutter:2.5.1 AS build-env

USER root
# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter config --enable-web
RUN flutter pub get
EXPOSE 80
CMD flutter run --debug -d web-server --web-port 80 --dart-define=BACKEND_LOCATION=api-pepetes.razafini.com