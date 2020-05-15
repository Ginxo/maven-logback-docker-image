# Maven with logstash libraries
## Maven 3.5.3 with logstash 6.3

# Build
`docker build -t maven-logstash .`

In case you want to use a different logback configuration, just replace the logstash.xml by the configuration you want and run the build command.

# Run
To make it works you just have to launch this image
`docker run --env APP_ID=lienzo-core --env LOG_ID=pr_12345 --env LOGSTASH_SERVER_HOST=localhost --env LOGSTASH_SERVER_PORT=5000`

- LOGSTASH_SERVER_HOST: The logstash server host.
- LOGSTASH_SERVER_PORT: The logstash server port.
- APP_ID: the application id you want to identify your logs with. This variable will be mapped to app_id elasticsearch field.
- LOG_ID: an speicific id you want to identify your logs with. I'm thinking about things like node id, job id or whatever identifier you want. The variable will be mapped to log_id elasticsearch field.
