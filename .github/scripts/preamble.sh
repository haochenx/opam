
CWD=$PWD
CACHE=~/.cache
CACHE=`eval echo $CACHE`
echo "Cache -> $CACHE"
OCAML_LOCAL=$CACHE/ocaml-local
OPAM_LOCAL=$CACHE/opam-local
PATH=$OPAM_LOCAL/bin:$OCAML_LOCAL/bin:$PATH; export PATH

OPAM_COLD=${OPAM_COLD:-0}
OPAM_TEST=${OPAM_TEST:-0}
OPAM_UPGRADE=${OPAM_UPGRADE:-0}

OPAMBSSWITCH=opam-build

case $GITHUB_EVENT_NAME in
  pull_request)
    BRANCH=$GITHUB_HEAD_REF
    ;;
  push)
    BRANCH=${GITHUB_REF##*/}
    ;;
  *)
  echo -e "Not handled event"
  BRANCH=master
esac

git config --global user.email "travis@example.com"
git config --global user.name "Travis CI"
git config --global gc.autoDetach false

# used only for TEST jobs
init-bootstrap () {
  if [ "$OPAM_TEST" = "1" ]; then
    set -e
    export OPAMROOT=$OPAMBSROOT
    # The system compiler will be picked up
    opam init --yes --no-setup git+https://github.com/ocaml/opam-repository#$OPAM_REPO_SHA --disable-sandboxing
    eval $(opam env)
#    opam update
    CURRENT_SWITCH=$(opam config var switch)
    if [[ $CURRENT_SWITCH != "default" ]] ; then
      opam switch default
      eval $(opam env)
      opam switch remove $CURRENT_SWITCH --yes
    fi

    opam switch create $OPAMBSSWITCH ocaml-system
    eval $(opam env)
    # extlib is installed, since UChar.cmi causes problems with the search
    # order. See also the removal of uChar and uTF8 in src_ext/jbuild-extlib-src
    opam install . --deps-only --yes

    rm -f "$OPAMBSROOT"/log/*
  fi
}
