git push
git subtree split --branch deploy --prefix public/
git checkout deploy
git push
git checkout master
