default:
    just --list

optimize:
    node scripts/optimize.js
    sed -i 's/image-rendering:optimizeSpeed/image-rendering:pixelated/g' svg/*.svg

render svg:
    ./scripts/make-ico.sh {{svg}}

render-all-ico:
    ./scripts/render-ico.sh

render-all-icns:
    ./scripts/render-icns.sh

render-all: render-all-ico render-all-icns

clean:
    rm -rf tmp