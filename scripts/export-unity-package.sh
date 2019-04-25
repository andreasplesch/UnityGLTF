#!/bin/bash
# invoke from repo root

project_path=$(pwd)/UnityGLTF
log_file=$(pwd)/build/unity-unix.log
export_path=$(pwd)/current-package/UnityGLTF.unitypackage
Unity=$(echo $HOME/Unity/Hub/Editor/*/Editor/Unity | gawk '{print $NF}')
if [[ -a /Applications/Unity/Unity.app/Contents/MacOS/Unity ]]; then
  Unity=/Applications/Unity/Unity.app/Contents/MacOS/Unity
fi

error_code=0

echo "Creating package."
$Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile "$log_file" \
  -projectPath "$project_path" \
  -exportPackage "Assets/UnityGLTF" "$export_path" \
  -quit
if [ $? = 0 ] ; then
  echo "Created package successfully."
  error_code=0
else
  echo "Creating package failed. Exited with $?."
  error_code=1
fi

echo 'Build logs:'
cat $log_file

echo "Finishing with code $error_code"
exit $error_code
