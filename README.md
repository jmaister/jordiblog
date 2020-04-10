
# Blog

My personal blog. Check it on https://jordiburgos.com

# Install Hugo

    wget https://github.com/gohugoio/hugo/releases/download/v0.69.0/hugo_0.69.0_Linux-64bit.deb -O hugo.deb
    sudo dpkg -i hugo.deb

## Install without root

    wget https://github.com/gohugoio/hugo/releases/download/v0.69.0/hugo_0.69.0_Linux-64bit.tar.gz -O hugo.tar.gz
    tar -xzvf hugo.tar.gz
    cp hugo ~/bin

# Test drafts

    hugo server -D --bind "0.0.0.0" --baseURL "http://paellalabs.com:1313/"

# Build

    hugo --baseURL "https://jordiburgos.com" --destination "dist"

# Theme

https://github.com/htr3n/hyde-hyde

    git submodule add https://github.com/htr3n/hyde-hyde.git themes/hyde-hyde


# Shortcodes

    {{< rawhtml >}}
    {{< /rawhtml >}}


    {{< imgur id >}}
    {{< /imgur >}}
