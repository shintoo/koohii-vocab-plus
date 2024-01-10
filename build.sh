mkdir dist
zip -q -r kvp-firefox-addon.zip lib manifest.json background.js
mv kvp-firefox-addon.zip dist
echo "Created dist/kvp-firefox-extension.zip"
mkdir build
#cp -r popup build/popup
#cp -r images build/images
cp -r lib build/lib

cp background.js build/background.js
cp manifest.json build/manifest.json
cd build
sed -i 's/"manifest_version": 2/"manifest_version": 3/' manifest.json
sed -i 's/browser/chrome/' lib/koohii-vocab-plus.js

zip -q -r kvp-chrome-extension.zip manifest.json lib
cd ..
mv build/kvp-chrome-extension.zip dist/.
rm -r build
echo "Created dist/kvp-chrome-extension.zip"
