#! /bin/sh

project_path=$(pwd)
log_file=$(pwd)/build/unity-mac.log

error_code=0

echo "Building project for Windows."
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile \
  -projectPath "$project_path" \
  -buildWindowsPlayer "$(pwd)/build/windows/vrtk.exe" \
  -quit
if [ $? = 0 ] ; then
  echo "Building Windows completed successfully."
  error_code=0
else
  echo "Building Windows failed. Exited with $?."
  error_code=1
fi

#echo 'Build logs:'
#cat $log_file

echo "Finishing with code $error_code"
exit $error_code
