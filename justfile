default:
    just --list

optimize svg:
    node scripts/optimizeOne.js {{svg}}

optimize-all:
    node scripts/optimizeAll.js

render-ico svg:
    ./scripts/make-ico.sh {{svg}}

render-icns svg:
    ./scripts/make-icns.sh {{svg}}

render-all-ico:
    ./scripts/render-ico.sh

render-all-icns:
    ./scripts/render-icns.sh

render-all: render-all-ico render-all-icns

clean:
    rm -rf tmp

# version format: v1.2.3
release version:
    mkdir tmp
    zip -r 'tmp/minecraft11.zip' ico icns
    zip -r 'tmp/minecraft11-shulkerboxes.zip' ico/shulkerbox* icns/shulkerbox*
    gh release create v{{version}}
    gh release upload v{{version}} tmp/minecraft11-*
