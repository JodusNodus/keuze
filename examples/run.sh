run() {
  appname=$(find /Applications -maxdepth 2 -type d -name "*.app" -printf '%f\n' | sed -e 's/\.app$//' | kies -p "run:")
  if [ -n "$appname" ]; then
    open -a "$appname"
  fi
}
