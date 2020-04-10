rm -rf ./dist/
hugo --baseURL "https://jordiburgos.com/" --destination "dist"

rsync -rav --delete dist/* ~/public_html/
