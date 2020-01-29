# INFO
# In order to use this "function" need to set compress_pdf in line 5 in the hotfolder.sh
# You need to have Ghostscript (in fact the command gs) installed and in stadardpath

# theese are the quality settings you can choose

#    screen = lower quality, smaller size. (72 dpi)
#    ebook  = for better quality, but slightly larger pdfs. (150 dpi)
#    prepress = output similar to Acrobat Distiller "Prepress Optimized" setting (300 dpi)
#    printer = selects output similar to the Acrobat Distiller "Print Optimized" setting (300 dpi)
#    default = selects output intended to be useful across a wide variety of uses, possibly at the expense of a larger output file


# choose name of the preset you wanna use
GHOSTSCRIPTPRESET="ebook"


# ------------------------ code ---------------------------------------------

if hash gs 2>/dev/null; then
	for filename in *.*; do
		# the ghostcript compress command
		# gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -sOutputFile=output2.pdf $filename
		gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/${GHOSTSCRIPTPRESET%.*} -sOutputFile="${filename%.*}_compressed_${GHOSTSCRIPTPRESET%.*}.pdf" "$filename"
		mv "${filename%.*}_compressed_${GHOSTSCRIPTPRESET%.*}.pdf" ../out/
		rm "$filename"
	done
else
	echo ERROR: Could not find GhostScript >&2
	echo GhostScript needs to installed and in standardpath for compress_pdf to work >&2
fi

	
