# Signs

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
