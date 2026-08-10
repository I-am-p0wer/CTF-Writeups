# NOTE: This hash is pinned to avoid version and environment differences.
FROM ubuntu:24.04@sha256:c35e29c9450151419d9448b0fd75374fec4fff364a27f176fb458d472dfc9e54 AS base
WORKDIR /app
COPY chall run
RUN echo "ctf4b{REDACTED}">/app/flag.txt

FROM pwn.red/jail
COPY --from=base / /srv
RUN chmod +x /srv/app/run
ENV JAIL_TIME=120 JAIL_CPU=100 JAIL_MEM=10M
