#!/bin/sh
#
# This script downloads all the software needed to run FeinCMS
#
# The difference from quickstart.sh is that this script sets up a virtualenv
# with release versions of the software instead of downloading the
# development versions from git
#

PYTHON_VERSION=2.7
ENV_DIR=~/env/feincms

PYTHON=python${PYTHON_VERSION}
PIP=pip

# Use virtualenv if present, fall back to virtualenv-2.7 if not.
VIRTUALENV=virtualenv
hash "${VIRTUALENV}" 2>&- || VIRTUALENV=virtualenv-${PYTHON_VERSION}

# Set PIP_DOWNLOAD_CACHE if it isn't already set. If it's already set then
# it's more efficient to re-use the existing cache than to have a separate
# one for this app.
if [ "${PIP_DOWNLOAD_CACHE}" == "" ]; then
    export PIP_DOWNLOAD_CACHE=~/env/cache
fi

echo Installing required packages into $ENV_DIR... \(this will take some time\)

if [ ! -d "${ENV_DIR}" ] ; then
	# If the virtualenv doesn't yet exist, then create it.
    mkdir -p `dirname "${ENV_DIR}"`
    "${VIRTUALENV}" --no-site-packages --distribute --python=${PYTHON} "${ENV_DIR}"
    . "${ENV_DIR}"/bin/activate
    ${PIP} install -r example/requirements.txt -E "${ENV_DIR}"
fi

cat <<EOD
Everything should be ready now. Type the following commands into the shell
to start the test server:

cd example
. $ENV_DIR/bin/activate
python manage.py runserver

Navigate to http://127.0.0.1:8000/admin/ to see the admin interface. The
username is 'admin', the password 'password'. You are probably most
interested in the page module.
EOD
