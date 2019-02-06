# episode six: resize image and add canvas
# example:
# ${0} ~/directory_input ~/directory_output 1210 907 

# directory where we'll shave all images
IN_DIRECTORY=$1
# output directory
OUT_DIRECTORY=$2
# shave sx-dx borders
X_AXIS=$3
Y_AXIS=$4

cd ${IN_DIRECTORY}
for IMAGE in ./*; 
do
    echo "elaborating ${IMAGE}"
    convert ${IMAGE} \
                     -resize x${Y_AXIS} \
                     -gravity center \
                     -extent ${X_AXIS}x${Y_AXIS} \
                     -background none \
            ${OUT_DIRECTORY}/${IMAGE}
done

