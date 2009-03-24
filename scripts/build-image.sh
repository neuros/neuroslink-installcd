IMAGE=custom.iso
PRJ=/home/tom/git/neuroslink-installcd
BUILD=$PRJ/cd-image/

cd $PRJ/configs
./create_seed.sh
cp neurostvpc.seed $BUILD/preseed
rm neurostvpc.seed
mkdir -p $BUILD/configs
cp isolinux.cfg $BUILD/isolinux
cp sources.list $BUILD/configs
cp ramfs-setup.sh $BUILD/configs

mkisofs -r -V "Custom Ubuntu Install CD" \
           -cache-inodes \
           -J -l -b isolinux/isolinux.bin \
           -c isolinux/boot.cat -no-emul-boot \
           -boot-load-size 4 -boot-info-table \
           -o $PRJ/$IMAGE $BUILD
