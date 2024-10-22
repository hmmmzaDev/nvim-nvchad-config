# Use the latest Alpine image
FROM alpine:latest

# Set the working directory
WORKDIR /root

# Install necessary packages
RUN apk add git curl bash nodejs neovim ripgrep build-base wget

# Copy your Neovim configuration to the container
COPY ./ /root/.config/nvim

# Set the entry point to Neovim
ENTRYPOINT ["nvim"]
