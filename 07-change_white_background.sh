# episode six: resize image and add canvas
# example:
# ${0} ~/directory_input ~/directory_output fuzz

# directory where we'll shave all images
IN_DIRECTORY=$1
# output directory
OUT_DIRECTORY=$2
# shave sx-dx borders
FUZZ=$3

cd ${IN_DIRECTORY}
for IMAGE in *; 
do
    echo "elaborating ${IMAGE}"
    convert ${IMAGE} \
        -fuzz ${FUZZ}% \
        -fill '#f7f7f7' \
        -opaque '#ecf6f5' \
        ${OUT_DIRECTORY}/${IMAGE}
done
