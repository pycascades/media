# Signs

## Rendering signs

### Fetch Fonts

The dockerfile expects Brevia to be present on your system. Since this is a licensed font, we've left it out of this
repo. Download the brevia OTF files from our Google Drive and place them in the `fonts` directory

### Build and run container

To render all the signs, from the `signs` directory:
```shell
$ docker build -t sign_renderer docker/  # note, you only need to build once
$ docker run --rm -v $(pwd):/work -u $(id -u):$(id -g) sign_renderer
```

To render just one sign, pass its name as an arg. You can pass the relative path or just the filename:

```shell
$ docker build -t sign_renderer --build-arg uid=$(id -u) --build-arg gid=$(id -g) docker/  # note, you only need to build once
$ docker run --rm -v $(pwd):/work -u $(id -u):$(id -g) sign_renderer 2023-backdrop-square.svg
```

## File formats *important*

The SVGs here are Inkscape-format SVGs. They will probably look mostly reasonable on their own, but really
should be exported to a different format before use, e.g. standard SVGs or some raster format.

## Inkscape sharp edges

When you use a `filter` in Inkscape, it only adds the filter metadata to the objects. This means that even in if you
export a standard SVG, it will look different outside of Inkscape. AFAIK, there's not a way to permanently apply the
filter to the object, so use care with filters if you intend to reuse SVGs outside of Inkscape.

## Preparing to print

1. Convert fonts to paths (`inkscape --without-gui --file="$file" --export-text-to-path --export-plain-svg="output\$file"`)
1. Export as standard SVG
1. Use a different program (probably Krita) to convert from an RGB SVG to a correctly-sized raster image in CMYK

