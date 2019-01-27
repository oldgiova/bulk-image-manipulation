# episode four: apply transparency
# example:
# ${0} ~/directory_input ~/directory_output 20 (fuzz)

# directory where we'll shave all images
IN_DIRECTORY=$1
# output directory
OUT_DIRECTORY=$2
# shave sx-dx borders
FUZZ=$3

cd ${IN_DIRECTORY}
for IMAGE in ./*; 
do
    echo "elaborating ${IMAGE}"
    magick ${IMAGE} -fuzz ${FUZZ}% -transparent '#f2f8f8' \
        ${OUT_DIRECTORY}/${IMAGE}
done

