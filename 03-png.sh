# episode three: convert to png and resize
# example:
# ${0} ~/directory

# directory where we'll shave all images
IN_DIRECTORY=$1
# output directory
OUT_DIRECTORY=$2
# shave sx-dx borders
FUZZ=$3

cd ${IN_DIRECTORY}
mogrify -format png *.JPG

