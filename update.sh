DIR=$PWD

if [[ $DIR == *"python-tools"* ]]; then
	cd ..
fi
echo "git submodule init"
git submodule init
echo "git submodule update"
git submodule update
echo "change dir into python-tools"
cd python-tools

echo "update python-tools"
git pull origin main
git checkout main
cd ..

echo "update commit-msg"
cp .github/hooks/commit-msg ../.git/hooks/commit-msg
chmod +x ../.git/hooks/commit-msg

echo "remove old version of pylintrc and .pre-commit-config.yaml and commit-msg"
rm -rf .pylintrc
rm -rf .pre-commit-config.yaml

echo "generate new files"
ln -s python-tools/.pylintrc .pylintrc
ln -s python-tools/.pre-commit-config.yaml .pre-commit-config.yaml

echo "done"

