# episode two: brightness adjust
# example:
# ${0} ~/directory_input ~/directory_output 20x20 (increase brightness+increase contrast)

# directory where we'll shave all images
IN_DIRECTORY=$1
# output directory
OUT_DIRECTORY=$2
# shave sx-dx borders
BRIGHTCONTR=$3

cd ${IN_DIRECTORY}
for IMAGE in ./*; 
do
    echo "elaborating ${IMAGE}"
    convert -brightness-contrast ${BRIGHTCONTR} ${IMAGE} \
        ${OUT_DIRECTORY}/${IMAGE}
done

