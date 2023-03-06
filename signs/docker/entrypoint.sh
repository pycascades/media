#!/usr/bin/env bash

output_dir=/work/output
mkdir -p ${output_dir}

function render() {
    no_extension="${filename%.*}"
    intermediate_png="${output_dir}/${no_extension}.png"
    final="${output_dir}/${no_extension}.pdf"
    # we could probably technically do all of this in imagemagick (`convert` below),
    # but I found inkscape's export a lot easier to control size consistently.
    inkscape --export-type=png --export-dpi=300 --export-filename="${output_dir}/${no_extension}.png" "${file}"
    # the debug is because the disk cache seems not to work without it
    convert -debug cache "${intermediate_png}" -colorspace CMYK ${final}
}


if [[ "$#" -gt 0 ]]; then
    render "$(basename $1)"
else
    for file in $(find /work/svgs -name '*.svg'); do
        filename="$(basename ${file})"
        render filename
    done
fi
