# episode one: shave them all
# example:
# ${0} ~/directory_input ~/directory_output 700

# directory where we'll shave all images
IN_DIRECTORY=$1
# output directory
OUT_DIRECTORY=$2
# shave sx-dx borders
SHAVE_SDX=$3

cd ${IN_DIRECTORY}
for IMAGE in ./*; 
do
    echo "shaving ${IMAGE}"
    convert ${IMAGE} -shave ${SHAVE_SDX}x0 ${OUT_DIRECTORY}/${IMAGE}
done

