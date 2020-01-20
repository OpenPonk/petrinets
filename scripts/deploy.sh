#!/bin/bash

set -euxo pipefail

export BUILD_NAME=$1
echo $BUILD_NAME

main() {
	local directory="tmp-${BUILD_NAME}"
	local zip="${BUILD_NAME}.zip"
	cp -r $SMALLTALK_CI_BUILD_BASE $directory
	echo "Deploying build ${BUILD_NAME}."
	
	rm -rf "$directory/pharo-local"
	zip -qr "$zip" "$directory"

	local platform="image"
	
	set +x
	echo "executing curl byplatform"
		curl -k -v -u "${DEPLOY_KEY}" --upload-file $zip https://nexus.openponk.ccmi.fit.cvut.cz/repository/builds/byplatform/"${platform}"/"${PHARO_VERSION}"/"${PROJECT_NAME}"/${zip}
	echo "executing curl byproduct"
		curl -k -v -u "${DEPLOY_KEY}" --upload-file $zip https://nexus.openponk.ccmi.fit.cvut.cz/repository/builds/byproduct/"${PROJECT_NAME}"/"${platform}"/"${PHARO_VERSION}"/${zip}
	echo "executing curl bybuild"
		curl -k -v -u "${DEPLOY_KEY}" --upload-file $zip https://nexus.openponk.ccmi.fit.cvut.cz/repository/builds/bybuild/"${PROJECT_NAME}"/"${TRAVIS_BUILD_NUMBER}"/${zip}
	set -x

	echo "Build ${BUILD_NAME} deployed."
}

if [ "$TRAVIS_BRANCH" = "master" ] || [ -n "$TRAVIS_TAG" ]; then
	main
fi

