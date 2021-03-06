#!/bin/bash
# ---------------------------------------------------------------------------
mkdir dist > /dev/null 2>&1
echo "Compiling..."
# ---------------------------------------------------------------------------
chmod a+x ./mvnw
./mvnw clean package > compiling.log
if [ $? -ne 0 ]; then
  echo "Compilation was failed. Check compiling.log for more details"
  exit $?
fi
# ---------------------------------------------------------------------------
cp -f target/Note-app-0.0.1-SNAPSHOT.jar dist
cp -f scripts/note-app.sh dist
chmod a+x dist/note-app.sh
rm -f target/
# ---------------------------------------------------------------------------
echo "...successfull v"
