
# Blog

My personal blog. Check it on https://jordiburgos.com

# Install Hugo

    wget https://github.com/gohugoio/hugo/releases/download/v0.68.3/hugo_0.68.3_Linux-64bit.deb -O hugo.deb
    sudo dpkg -i hugo.deb

# Test drafts

    hugo server -D --bind "0.0.0.0" --baseURL "http://paellalabs.com:1313/"

# Build

    hugo --baseURL "https://jordiburgos.com" --destination "dist"

