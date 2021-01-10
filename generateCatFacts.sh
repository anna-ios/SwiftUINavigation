MODULE_SRC=SwiftUINavigation/Modules/Networking/Sources/Networking/Cats
openapi-generator generate -i cat-fact.yaml -g swift5 -o api-mobile
rm -r $MODULE_SRC""*
cp -R api-mobile/OpenAPIClient/Classes/OpenAPIs/. $MODULE_SRC
rm -r api-mobile
