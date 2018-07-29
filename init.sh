set -e

ZIP_URL=https://doc-0g-3k-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/5ltknhkjtoppq42p2la17aub7ak0u9l3/1532865600000/10713371595697615877/*/1eoNza-pl9REl77vCTxnxqFMZIxTVc9-F?e=download;

echo 'Downloading dependencies...';
curl -o frameworks.zip $ZIP_URL;
echo 'Extracting dependencies...';
unzip -n frameworks.zip -d frameworks.tmp;
echo 'Moving dependencies...';
mv frameworks.tmp/*.framework FIT4002-v1;
echo 'Cleaning up...';
rm -R frameworks.tmp;
rm frameworks.zip;
echo 'Finished!';