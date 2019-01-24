# episode one: crop them all
# example:
# ${0} ~/directory_input ~/directory_output 700

# directory where we'll shave all images
IN_DIRECTORY=$1
# output directory
OUT_DIRECTORY=$2

cd ${IN_DIRECTORY}
for IMAGE in ./*; 
do
    echo "elaborating ${IMAGE}"
    convert ${IMAGE} \
        -chop 5000x0+5000+0 ${OUT_DIRECTORY}/${IMAGE}
done

