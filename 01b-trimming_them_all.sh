# episode one: crop them all
# example:
# ${0} ~/directory_input ~/directory_output 700

# directory where we'll shave all images
IN_DIRECTORY=$1
# output directory
OUT_DIRECTORY=$2
# shave sx-dx borders
FUZZING=$3

cd ${IN_DIRECTORY}
for IMAGE in ./*; 
do
    echo "elaborating ${IMAGE}"
    magick ${IMAGE} \
        \( +clone -virtual-pixel edge -blur 0x15 -fuzz ${FUZZING}% -trim -set option:fuzzy_trim \
                    '%[fx:w+200]x%[fx:h+200]+%[fx:page.x-100]+%[fx:page.y-100]' +delete \) \
        -crop %\[fuzzy_trim\] ${OUT_DIRECTORY}/${IMAGE}
done

