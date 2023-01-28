git push
zola build
git subtree split --branch deploy --prefix public/
git checkout deploy
git push
git chekcout master
