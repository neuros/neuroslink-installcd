IMAGE=custom.iso
PRJ=/srv/projects/neuros-cd
BUILD=$PRJ/cd-image/

cd $PRJ/configs
./create_seed.sh
cp neurostvpc.seed $BUILD/preseed
cp isolinux.cfg $BUILD/isolinux
rm neurostvpc.seed
mkdir $BUILD/custom-files
cp sources.list $BUILD/custom-files
cp ramfs-setup.sh $BUILD/custom-files

mkisofs -r -V "Custom Ubuntu Install CD" \
            -cache-inodes \
            -J -l -b isolinux/isolinux.bin \
            -c isolinux/boot.cat -no-emul-boot \
            -boot-load-size 4 -boot-info-table \
            -o $PRJ/$IMAGE $BUILD
