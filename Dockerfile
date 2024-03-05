# Use a Rust base image
FROM rust:1.76.0-slim-buster as builder

# Create a new empty shell project
RUN USER=root cargo new --bin rust-sample
WORKDIR /rust-sample

# Copy our manifests
COPY ./Cargo.toml ./Cargo.toml

# Build only the dependencies to cache them
RUN cargo build --release
RUN rm src/*.rs

# Now that the dependencies are built, copy your source code
COPY ./src ./src

# Build for release
RUN cargo build --release

# Final base image
FROM debian:buster-slim

# Copy the build artifact from the build stage and set the run command
COPY --from=builder /rust-sample/target/release/rust-sample .

CMD ["./rust-sample"]
