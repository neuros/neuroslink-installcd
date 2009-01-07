BUILD=/srv/projects/neuros-cd/cd-image
APTCONF=/srv/projects/neuros-cd/apt-ftparchive/release.conf
DISTNAME=intrepid

pushd $BUILD
apt-ftparchive -c $APTCONF generate /srv/projects/neuros-cd/apt-ftparchive/apt-ftparchive-deb.conf
apt-ftparchive -c $APTCONF generate /srv/projects/neuros-cd/apt-ftparchive/apt-ftparchive-udeb.conf
apt-ftparchive -c $APTCONF generate /srv/projects/neuros-cd/apt-ftparchive/apt-ftparchive-extras.conf
apt-ftparchive -c $APTCONF release $BUILD/dists/$DISTNAME > $BUILD/dists/$DISTNAME/Release

gpg --default-key "7794ADB8" --output $BUILD/dists/$DISTNAME/Release.gpg -ba $BUILD/dists/$DISTNAME/Release
find . -type f -print0 | xargs -0 md5sum > md5sum.txt
popd
