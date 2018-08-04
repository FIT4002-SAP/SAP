set -e

ZIP_URL=https://s3-ap-southeast-2.amazonaws.com/fit4002-intelligence-content-2/frameworks.zip;

echo 'Downloading dependencies...';
curl -o frameworks.zip $ZIP_URL;
echo 'Extracting dependencies...';
unzip -n frameworks.zip -d frameworks.tmp;
echo 'Moving dependencies...';
mv frameworks.tmp/*.framework IOT-Manager;
echo 'Cleaning up...';
rm -R frameworks.tmp;
rm frameworks.zip;

echo 'Finished!';
