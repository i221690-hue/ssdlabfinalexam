
#!/bin/bash
TARGET_DIR=${1:-/tmp/flask_deploy}
mkdir -p "$TARGET_DIR"
cp -r . "$TARGET_DIR"
echo "Application deployed to $TARGET_DIR"
